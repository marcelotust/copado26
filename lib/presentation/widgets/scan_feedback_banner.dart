import 'package:copado26/core/constants/app_colors.dart';
import 'package:copado26/presentation/blocs/scanner/scanner_bloc.dart';
import 'package:flutter/material.dart';

class ScanFeedbackBanner extends StatelessWidget {
  const ScanFeedbackBanner({required this.state, super.key});

  final ScannerState state;

  @override
  Widget build(BuildContext context) {
    final (color, icon, text) = switch (state) {
      ScannerSuccess(:final sticker) => (
          AppColors.stickerOwned,
          Icons.check_circle,
          '${sticker.section} ${sticker.number} — ${sticker.quantity}x',
        ),
      ScannerError(:final failure) => (
          AppColors.accent,
          Icons.error_outline,
          failure.message,
        ),
      _ => (Colors.transparent, Icons.info, ''),
    };

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ],
      ),
    );
  }
}
