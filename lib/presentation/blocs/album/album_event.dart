part of 'album_bloc.dart';

sealed class AlbumEvent {
  const AlbumEvent();
}

final class AlbumLoaded extends AlbumEvent {
  const AlbumLoaded();
}

final class AlbumStickerDecremented extends AlbumEvent {
  const AlbumStickerDecremented(this.stickerId);
  final String stickerId;
}

final class AlbumUpdated extends AlbumEvent {
  const AlbumUpdated(this.stickers);
  final List<Sticker> stickers;
}
