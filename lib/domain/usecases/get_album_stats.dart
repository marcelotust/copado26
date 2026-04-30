import 'package:copado26/domain/entities/sticker.dart';
import 'package:copado26/domain/repositories/sticker_repository.dart';

class AlbumStats {
  const AlbumStats({
    required this.total,
    required this.owned,
    required this.duplicates,
    required this.bySection,
  });

  final int total;
  final int owned;
  final int duplicates;

  /// section → (owned, total)
  final Map<String, (int, int)> bySection;

  double get completionRatio => total == 0 ? 0 : owned / total;
}

class GetAlbumStats {
  const GetAlbumStats(this._repository);

  final StickerRepository _repository;

  Future<AlbumStats> call() async {
    final stickers = await _repository.getAllStickers();
    final owned = stickers.where((s) => s.isOwned).length;
    final duplicates = stickers.where((s) => s.isDuplicate).length;

    final Map<String, (int, int)> bySection = {};
    for (final s in stickers) {
      final current = bySection[s.section] ?? (0, 0);
      bySection[s.section] = (
        current.$1 + (s.isOwned ? 1 : 0),
        current.$2 + 1,
      );
    }

    return AlbumStats(
      total: stickers.length,
      owned: owned,
      duplicates: duplicates,
      bySection: bySection,
    );
  }
}
