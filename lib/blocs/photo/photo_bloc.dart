import 'package:bloc/bloc.dart';
import 'package:eclipse_test/config/api_client.dart';
import 'package:equatable/equatable.dart';
import '../../modals/modals.dart';
part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final _client = ApiClient();
  PhotoBloc() : super(PhotoLoading()) {
    on<GetPhoto>(
      (event, emit) async {
        emit(PhotoLoading());
        try {
          final photosJson = await _client.getPhoto();
          emit(PhotoLoaded(photos: photosJson));
        } catch (e) {
          const PhotoError(errorMassage: 'Произошла ошибка');
        }
      },
    );
  }
}
