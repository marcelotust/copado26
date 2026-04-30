import 'dart:async';

import 'package:camera/camera.dart';
import 'package:copado26/core/constants/app_constants.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

typedef CodeCallback = void Function(String code);

/// Manages camera lifecycle and ML Kit text recognition.
class ScannerController {
  ScannerController({required this.onCodeDetected});

  final CodeCallback onCodeDetected;

  CameraController? _cameraController;
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _isProcessing = false;
  bool _isInitialized = false;

  // Regex: 3 uppercase letters, space, 1–3 digits. E.g. "MAR 4".
  static final _codePattern = RegExp(r'[A-Z]{3}\s\d{1,3}');

  CameraController? get cameraController => _cameraController;
  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    _cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.nv21,
    );

    await _cameraController!.initialize();
    await _cameraController!.startImageStream(_processFrame);
    _isInitialized = true;
  }

  Future<void> _processFrame(CameraImage image) async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      final inputImage = _buildInputImage(image);
      if (inputImage == null) return;

      final recognized = await _textRecognizer.processImage(inputImage);

      // Only look at the top portion of the frame (sticker code area).
      final frameHeight = image.height.toDouble();
      final targetBottom = frameHeight * AppConstants.scanOverlayHeightRatio * 1.5;

      for (final block in recognized.blocks) {
        final blockTop = block.boundingBox?.top ?? double.infinity;
        if (blockTop > targetBottom) continue;

        for (final line in block.lines) {
          final match = _codePattern.firstMatch(line.text);
          if (match != null) {
            onCodeDetected(match.group(0)!);
            return;
          }
        }
      }
    } finally {
      _isProcessing = false;
    }
  }

  InputImage? _buildInputImage(CameraImage image) {
    if (_cameraController == null) return null;

    final camera = _cameraController!.description;
    final rotation = InputImageRotationValue.fromRawValue(
      camera.sensorOrientation,
    );
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw as int);
    if (format == null ||
        (format != InputImageFormat.nv21 && format != InputImageFormat.bgra8888)) {
      return null;
    }

    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }

  void dispose() {
    _cameraController?.stopImageStream().ignore();
    _cameraController?.dispose();
    _cameraController = null;
    _textRecognizer.close();
    _isInitialized = false;
  }
}
