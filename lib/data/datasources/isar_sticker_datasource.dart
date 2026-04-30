import 'package:copado26/data/models/sticker_model.dart';
import 'package:isar/isar.dart';

class IsarStickerDatasource {
  const IsarStickerDatasource(this._isar);

  final Isar _isar;

  Future<List<StickerModel>> getAll() =>
      _isar.stickerModels.where().findAll();

  Future<StickerModel?> getByCanonicalId(String canonicalId) =>
      _isar.stickerModels.where().canonicalIdEqualTo(canonicalId).findFirst();

  Future<void> put(StickerModel model) =>
      _isar.writeTxn(() => _isar.stickerModels.put(model));

  Future<List<StickerModel>> getBySection(String section) => _isar.stickerModels
      .where()
      .filter()
      .stickerSectionEqualTo(section)
      .findAll();

  Future<List<StickerModel>> getDuplicates() => _isar.stickerModels
      .where()
      .filter()
      .quantityGreaterThan(1)
      .findAll();

  Stream<List<StickerModel>> watchAll() => _isar.stickerModels
      .where()
      .watch(fireImmediately: true);
}
