import 'package:copado26/data/datasources/hive_sticker_datasource.dart';
import 'package:copado26/data/models/sticker_model.dart';
import 'package:copado26/domain/entities/sticker.dart';
import 'package:copado26/domain/repositories/sticker_repository.dart';

final class StickerRepositoryImpl implements StickerRepository {
  const StickerRepositoryImpl(this._datasource);

  final HiveStickerDatasource _datasource;

  @override
  Future<List<Sticker>> getAllStickers() async =>
      _datasource.getAll().map((m) => m.toEntity()).toList();

  @override
  Future<Sticker?> getStickerById(String id) async =>
      _datasource.getByCanonicalId(id)?.toEntity();

  @override
  Future<void> upsertSticker(Sticker sticker) =>
      _datasource.put(StickerModel.fromEntity(sticker));

  @override
  Future<void> incrementQuantity(String id) async {
    final model = _datasource.getByCanonicalId(id);
    if (model == null) return;
    await _datasource.put(model.copyWith(quantity: model.quantity + 1));
  }

  @override
  Future<void> decrementQuantity(String id) async {
    final model = _datasource.getByCanonicalId(id);
    if (model == null || model.quantity == 0) return;
    await _datasource.put(model.copyWith(quantity: model.quantity - 1));
  }

  @override
  Future<List<Sticker>> getBySection(String section) async =>
      _datasource.getBySection(section).map((m) => m.toEntity()).toList();

  @override
  Future<List<Sticker>> getDuplicates() async =>
      _datasource.getDuplicates().map((m) => m.toEntity()).toList();

  @override
  Stream<List<Sticker>> watchAllStickers() =>
      _datasource.watchAll().map((list) => list.map((m) => m.toEntity()).toList());
}
