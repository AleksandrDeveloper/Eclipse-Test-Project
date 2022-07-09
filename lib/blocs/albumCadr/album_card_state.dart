part of 'album_card_bloc.dart';

abstract class AlbumCardState extends Equatable {
  const AlbumCardState();

  @override
  List<Object> get props => [];
}

class AlbumCardInternetNoConnect extends AlbumCardState {}

class AlbumCardInternetConnect extends AlbumCardState {}
