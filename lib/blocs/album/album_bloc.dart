import 'package:bloc/bloc.dart';
import 'package:eclipse_test/config/api_client.dart';
import 'package:equatable/equatable.dart';

import '../../modals/modals.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final _client = ApiClient();
  AlbumBloc() : super(AlbumLoading()) {
    on<GetAlbum>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albumJson = await _client.getAlbum();
        final photosJson = await _client.getPhoto();
        emit(AlbumLoaded(albums: albumJson, photos: photosJson));
      } catch (e) {
        const AlbumError(errorMassage: 'Произошла ошибка');
      }
    });
  }
}
