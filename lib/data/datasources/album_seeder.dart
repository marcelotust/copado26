import 'package:copado26/core/constants/app_constants.dart';
import 'package:copado26/data/datasources/hive_sticker_datasource.dart';
import 'package:copado26/data/models/sticker_model.dart';

class AlbumSeeder {
  const AlbumSeeder(this._datasource);

  final HiveStickerDatasource _datasource;

  Future<void> seedIfEmpty() async {
    if (_datasource.getAll().isNotEmpty) return;

    for (final entry in WorldCup2026Teams.codes.entries) {
      for (var n = 1; n <= WorldCup2026Teams.stickersPerTeam; n++) {
        await _datasource.put(
          StickerModel(
            canonicalId: '${entry.key}_$n',
            stickerSection: entry.key,
            stickerNumber: n,
            quantity: 0,
            isSpecial: n == WorldCup2026Teams.stickersPerTeam,
          ),
        );
      }
    }
  }
}
