import 'package:copado26/core/errors/failures.dart';
import 'package:copado26/domain/entities/sticker.dart';
import 'package:copado26/domain/repositories/sticker_repository.dart';

class ScanStickerCode {
  const ScanStickerCode(this._repository);

  final StickerRepository _repository;

  /// Returns the updated [Sticker] after incrementing quantity,
  /// or a [Failure] if the code is unknown.
  Future<(Sticker?, Failure?)> call(String rawCode) async {
    final id = _normalizeCode(rawCode);
    if (id == null) return (null, const InvalidCodeFailure());

    final existing = await _repository.getStickerById(id);
    if (existing == null) return (null, UnknownStickerFailure(id));

    await _repository.incrementQuantity(id);
    final updated = await _repository.getStickerById(id);
    return (updated, null);
  }

  /// Converts "MAR 4" → "MAR_4".
  String? _normalizeCode(String raw) {
    final match = RegExp(r'^([A-Z]{3})\s+(\d+)$').firstMatch(raw.trim());
    if (match == null) return null;
    return '${match.group(1)}_${match.group(2)}';
  }
}
