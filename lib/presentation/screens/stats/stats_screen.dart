import 'package:copado26/core/constants/app_colors.dart';
import 'package:copado26/core/constants/app_constants.dart';
import 'package:copado26/domain/usecases/get_album_stats.dart';
import 'package:copado26/presentation/blocs/album/album_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        if (state is AlbumLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is! AlbumDataLoaded) return const SizedBox.shrink();

        // Compute stats inline from loaded stickers.
        final stickers = state.stickers;
        final total = stickers.length;
        final owned = stickers.where((s) => s.isOwned).length;
        final duplicates = stickers.where((s) => s.isDuplicate).length;
        final completion = total == 0 ? 0.0 : owned / total;

        final Map<String, (int, int)> bySection = {};
        for (final s in stickers) {
          final cur = bySection[s.section] ?? (0, 0);
          bySection[s.section] = (cur.$1 + (s.isOwned ? 1 : 0), cur.$2 + 1);
        }
        final sortedSections = bySection.entries.toList()
          ..sort((a, b) {
            final ratioA = a.value.$2 == 0 ? 0.0 : a.value.$1 / a.value.$2;
            final ratioB = b.value.$2 == 0 ? 0.0 : b.value.$1 / b.value.$2;
            return ratioB.compareTo(ratioA);
          });

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _TotalProgressCard(owned: owned, total: total, completion: completion, duplicates: duplicates),
            const SizedBox(height: 20),
            const Text(
              'Por Seleção',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...sortedSections.map(
              (entry) => _TeamProgressRow(
                section: entry.key,
                owned: entry.value.$1,
                total: entry.value.$2,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TotalProgressCard extends StatelessWidget {
  const _TotalProgressCard({
    required this.owned,
    required this.total,
    required this.completion,
    required this.duplicates,
  });

  final int owned;
  final int total;
  final double completion;
  final int duplicates;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Álbum completo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  '${(completion * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: _completionColor(completion),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: completion,
                minHeight: 16,
                backgroundColor: AppColors.stickerMissing.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation(_completionColor(completion)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatChip(label: 'Coletadas', value: owned, color: AppColors.stickerOwned),
                _StatChip(label: 'Faltando', value: total - owned, color: AppColors.stickerMissing),
                _StatChip(label: 'Repetidas', value: duplicates, color: AppColors.stickerDuplicate),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _completionColor(double ratio) {
    if (ratio >= 1.0) return AppColors.stickerSpecial;
    if (ratio >= 0.75) return AppColors.stickerOwned;
    if (ratio >= 0.5) return Colors.orange;
    return AppColors.accent;
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value, required this.color});

  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
        ),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}

class _TeamProgressRow extends StatelessWidget {
  const _TeamProgressRow({required this.section, required this.owned, required this.total});

  final String section;
  final int owned;
  final int total;

  @override
  Widget build(BuildContext context) {
    final ratio = total == 0 ? 0.0 : owned / total;
    final teamName = WorldCup2026Teams.codes[section] ?? section;
    final isComplete = owned == total && total > 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              section,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(teamName, style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 2),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: ratio,
                    minHeight: 8,
                    backgroundColor: AppColors.stickerMissing.withOpacity(0.25),
                    valueColor: AlwaysStoppedAnimation(
                      isComplete ? AppColors.stickerSpecial : AppColors.stickerOwned,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 40,
            child: Text(
              '$owned/$total',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
              textAlign: TextAlign.end,
            ),
          ),
          if (isComplete)
            const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Icon(Icons.star, color: AppColors.stickerSpecial, size: 16),
            ),
        ],
      ),
    );
  }
}
