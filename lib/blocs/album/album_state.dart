part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> albums;
  final List<Photo> photos;
  const AlbumLoaded({
    required this.albums,
    required this.photos,
  });
  @override
  List<Object> get props => [albums, photos];
}

class AlbumError extends AlbumState {
  final String errorMassage;
  const AlbumError({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
