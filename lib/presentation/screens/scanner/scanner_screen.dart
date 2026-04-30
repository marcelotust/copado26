import 'package:camera/camera.dart';
import 'package:copado26/core/constants/app_colors.dart';
import 'package:copado26/core/constants/app_constants.dart';
import 'package:copado26/presentation/blocs/scanner/scanner_bloc.dart';
import 'package:copado26/presentation/screens/scanner/scanner_controller.dart';
import 'package:copado26/presentation/widgets/scan_feedback_banner.dart';
import 'package:copado26/presentation/widgets/scan_overlay_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> with WidgetsBindingObserver {
  late final ScannerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = ScannerController(
      onCodeDetected: (code) =>
          context.read<ScannerBloc>().add(ScannerCodeDetected(code)),
    );
    _init();
  }

  Future<void> _init() async {
    await _controller.initialize();
    if (mounted) {
      context.read<ScannerBloc>().add(const ScannerStarted());
      setState(() {});
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_controller.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      _controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _init();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    context.read<ScannerBloc>().add(const ScannerStopped());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Escanear Figurinha'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: BlocConsumer<ScannerBloc, ScannerState>(
        listener: _onStateChange,
        builder: (context, state) {
          if (!_controller.isInitialized) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.secondary),
            );
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              CameraPreview(_controller.cameraController!),
              CustomPaint(
                painter: ScanOverlayPainter(
                  widthRatio: AppConstants.scanOverlayWidthRatio,
                  heightRatio: AppConstants.scanOverlayHeightRatio,
                ),
              ),
              if (state is ScannerSuccess || state is ScannerError)
                Positioned(
                  bottom: 32,
                  left: 16,
                  right: 16,
                  child: ScanFeedbackBanner(state: state),
                ),
              Positioned(
                top: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Aponte para o código no verso da figurinha',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onStateChange(BuildContext context, ScannerState state) {
    if (state is ScannerSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✓ ${state.sticker.section} ${state.sticker.number} registrada! (${state.sticker.quantity}x)',
          ),
          backgroundColor: AppColors.stickerOwned,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
