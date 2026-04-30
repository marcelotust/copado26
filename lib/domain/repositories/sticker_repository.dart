import 'package:copado26/domain/entities/sticker.dart';

abstract interface class StickerRepository {
  Future<List<Sticker>> getAllStickers();
  Future<Sticker?> getStickerById(String id);
  Future<void> upsertSticker(Sticker sticker);
  Future<void> incrementQuantity(String id);
  Future<void> decrementQuantity(String id);
  Future<List<Sticker>> getBySection(String section);
  Future<List<Sticker>> getDuplicates();
  Stream<List<Sticker>> watchAllStickers();
}
