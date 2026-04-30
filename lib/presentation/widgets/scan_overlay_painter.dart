import 'package:copado26/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// Draws a dark overlay with a transparent cutout for the scan target zone.
/// The cutout sits at the top-center of the frame, mirroring the sticker back layout.
class ScanOverlayPainter extends CustomPainter {
  const ScanOverlayPainter({
    required this.widthRatio,
    required this.heightRatio,
  });

  final double widthRatio;
  final double heightRatio;

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()..color = AppColors.scanOverlay;
    final borderPaint = Paint()
      ..color = AppColors.scanBorder
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final cutoutWidth = size.width * widthRatio;
    final cutoutHeight = size.height * heightRatio;
    final left = (size.width - cutoutWidth) / 2;
    const top = 60.0;

    final cutout = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, cutoutWidth, cutoutHeight),
      const Radius.circular(12),
    );

    final fullRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final path = Path()
      ..addRect(fullRect)
      ..addRRect(cutout)
      ..fillType = PathFillType.evenOdd;

    canvas
      ..drawPath(path, overlayPaint)
      ..drawRRect(cutout, borderPaint);

    // Corner accents
    _drawCornerAccents(canvas, cutout.outerRect, borderPaint);
  }

  void _drawCornerAccents(Canvas canvas, Rect rect, Paint paint) {
    const len = 20.0;
    final corners = [
      (rect.topLeft, Offset(len, 0), Offset(0, len)),
      (rect.topRight, Offset(-len, 0), Offset(0, len)),
      (rect.bottomLeft, Offset(len, 0), Offset(0, -len)),
      (rect.bottomRight, Offset(-len, 0), Offset(0, -len)),
    ];

    for (final (corner, h, v) in corners) {
      canvas
        ..drawLine(corner, corner + h, paint)
        ..drawLine(corner, corner + v, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
