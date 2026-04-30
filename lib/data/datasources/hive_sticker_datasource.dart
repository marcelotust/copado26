import 'dart:async';

import 'package:copado26/data/models/sticker_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStickerDatasource {
  HiveStickerDatasource(this._box);

  static const boxName = 'stickers';

  final Box<Map<dynamic, dynamic>> _box;

  // Stream controller to emit reactive updates (mirrors Isar's watch API).
  final _controller = StreamController<List<StickerModel>>.broadcast();

  List<StickerModel> getAll() => _box.keys
      .map((k) => StickerModel.fromMap(k as String, _box.get(k)!))
      .toList();

  StickerModel? getByCanonicalId(String id) {
    final raw = _box.get(id);
    if (raw == null) return null;
    return StickerModel.fromMap(id, raw);
  }

  Future<void> put(StickerModel model) async {
    await _box.put(model.canonicalId, model.toMap());
    _controller.add(getAll());
  }

  List<StickerModel> getBySection(String section) => getAll()
      .where((m) => m.stickerSection == section)
      .toList();

  List<StickerModel> getDuplicates() =>
      getAll().where((m) => m.quantity > 1).toList();

  Stream<List<StickerModel>> watchAll() {
    // Fire immediately with current state.
    Future.microtask(() => _controller.add(getAll()));
    return _controller.stream;
  }

  void dispose() => _controller.close();
}
