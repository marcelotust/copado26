import 'package:copado26/core/constants/app_colors.dart';
import 'package:copado26/core/constants/app_constants.dart';
import 'package:copado26/domain/entities/sticker.dart';
import 'package:copado26/presentation/blocs/album/album_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwapsScreen extends StatelessWidget {
  const SwapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        if (state is AlbumLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is! AlbumDataLoaded) return const SizedBox.shrink();

        final duplicates = state.stickers.where((s) => s.isDuplicate).toList()
          ..sort((a, b) => a.section.compareTo(b.section));

        if (duplicates.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.swap_horiz, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Nenhuma figurinha repetida ainda.',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: duplicates.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) => _SwapTile(
            sticker: duplicates[i],
            onDecrement: () => context
                .read<AlbumBloc>()
                .add(AlbumStickerDecremented(duplicates[i].id)),
          ),
        );
      },
    );
  }
}

class _SwapTile extends StatelessWidget {
  const _SwapTile({required this.sticker, required this.onDecrement});

  final Sticker sticker;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final teamName = WorldCup2026Teams.codes[sticker.section] ?? sticker.section;
    final extras = sticker.quantity - 1;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: sticker.isSpecial ? AppColors.stickerSpecial : AppColors.stickerDuplicate,
        child: Text(
          sticker.section,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
        ),
      ),
      title: Text(
        '$teamName — #${sticker.number}${sticker.isSpecial ? ' ★' : ''}',
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text('$extras repetida${extras > 1 ? 's' : ''}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.stickerDuplicate.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${sticker.quantity}x',
              style: const TextStyle(
                color: AppColors.stickerDuplicate,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: AppColors.accent,
            tooltip: 'Marcar como trocada',
            onPressed: onDecrement,
          ),
        ],
      ),
    );
  }
}
