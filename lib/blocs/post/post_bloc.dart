import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../config/api_client.dart';
import '../../modals/modals.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _client = ApiClient();
  PostBloc() : super(PostLoading()) {
    on<GetPost>((event, emit) async {
      emit(PostLoading());
      try {
        final postsJson = await _client.getPost();
        emit(PostLoaded(posts: postsJson));
      } catch (e) {
        emit(const PostError(errorMassage: 'Произошла ошибка'));
      }
    });
  }
}
