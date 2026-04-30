import 'package:copado26/core/constants/app_colors.dart';
import 'package:copado26/domain/entities/sticker.dart';
import 'package:flutter/material.dart';

class StickerGridTile extends StatelessWidget {
  const StickerGridTile({required this.sticker, super.key});

  final Sticker sticker;

  @override
  Widget build(BuildContext context) {
    final color = _tileColor();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: sticker.isSpecial
            ? Border.all(color: AppColors.stickerSpecial, width: 2)
            : null,
        boxShadow: sticker.isOwned
            ? [BoxShadow(color: color.withOpacity(0.4), blurRadius: 4, offset: const Offset(0, 2))]
            : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                sticker.number.toString(),
                style: TextStyle(
                  color: sticker.isOwned ? Colors.white : Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (sticker.isSpecial)
                const Icon(Icons.star, color: AppColors.stickerSpecial, size: 12),
            ],
          ),
          if (sticker.isDuplicate)
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: AppColors.stickerDuplicate,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '+${sticker.quantity - 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _tileColor() {
    if (!sticker.isOwned) return AppColors.stickerMissing;
    if (sticker.isSpecial) return AppColors.stickerSpecial;
    return AppColors.stickerOwned;
  }
}
