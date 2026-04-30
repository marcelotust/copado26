part of 'album_bloc.dart';

sealed class AlbumState {
  const AlbumState();
}

final class AlbumInitial extends AlbumState {
  const AlbumInitial();
}

final class AlbumLoading extends AlbumState {
  const AlbumLoading();
}

final class AlbumDataLoaded extends AlbumState {
  const AlbumDataLoaded(this.stickers);
  final List<Sticker> stickers;
}

final class AlbumFailure extends AlbumState {
  const AlbumFailure(this.message);
  final String message;
}
