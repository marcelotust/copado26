import 'dart:async';

import 'package:copado26/domain/entities/sticker.dart';
import 'package:copado26/domain/repositories/sticker_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc(this._repository) : super(const AlbumInitial()) {
    on<AlbumLoaded>(_onLoaded);
    on<AlbumUpdated>(_onUpdated);
    on<AlbumStickerDecremented>(_onDecremented);
  }

  final StickerRepository _repository;
  StreamSubscription<List<Sticker>>? _subscription;

  void _onLoaded(AlbumLoaded event, Emitter<AlbumState> emit) {
    emit(const AlbumLoading());
    _subscription?.cancel();
    _subscription = _repository.watchAllStickers().listen(
      (stickers) => add(AlbumUpdated(stickers)),
      onError: (Object e) => emit(AlbumFailure(e.toString())),
    );
  }

  void _onUpdated(AlbumUpdated event, Emitter<AlbumState> emit) {
    emit(AlbumDataLoaded(event.stickers));
  }

  Future<void> _onDecremented(
    AlbumStickerDecremented event,
    Emitter<AlbumState> emit,
  ) async {
    await _repository.decrementQuantity(event.stickerId);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
