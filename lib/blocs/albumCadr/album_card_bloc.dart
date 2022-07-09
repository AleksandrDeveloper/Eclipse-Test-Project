import 'package:bloc/bloc.dart';
import 'package:eclipse_test/config/api_client.dart';
import 'package:equatable/equatable.dart';

part 'album_card_event.dart';
part 'album_card_state.dart';

class AlbumCardBloc extends Bloc<AlbumCardEvent, AlbumCardState> {
  final _client = ApiClient();
  AlbumCardBloc() : super(AlbumCardInternetNoConnect()) {
    on<GetImage>((event, emit) async {
      final internetConnect = await _client.internetChecker();
      if (internetConnect == true) {
        print('internet yes Connect');
        emit(AlbumCardInternetConnect());
      }
      if (internetConnect == false) {
        print('internet no Connect');
        emit(AlbumCardInternetNoConnect());
      }
    });
  }
}
