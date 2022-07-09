part of 'album_card_bloc.dart';

abstract class AlbumCardEvent extends Equatable {
  const AlbumCardEvent();

  @override
  List<Object> get props => [];
}

class GetImage extends AlbumCardEvent {}
