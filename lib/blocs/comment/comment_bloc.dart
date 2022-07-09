import 'package:bloc/bloc.dart';
import 'package:eclipse_test/modals/modals.dart';
import 'package:equatable/equatable.dart';

import '../../config/api_client.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final _client = ApiClient();
  CommentBloc() : super(CommentLoading()) {
    on<GetComment>((event, emit) async {
      emit(CommentLoading());
      try {
        final commentJson = await _client.getComment();
        emit(CommentLoaded(comments: commentJson));
      } catch (e) {
        emit(
          const CommentError(errorMassage: 'Произошла ошибка'),
        );
      }
    });
    on<PostComment>(
      (event, emit) async {
        emit(CommentLoading());
        final name = event.name;
        final email = event.email;
        final body = event.body;
        final postId = event.postId;
        try {
          if (name.isNotEmpty || email.isNotEmpty || body.isNotEmpty) {
            await _client.postComment(
              name: name,
              email: email,
              body: body,
              postId: postId,
            );

            final newCommentJson = await _client.getComment();
            emit(CommentLoaded(comments: newCommentJson));
          }
        } catch (e) {
          emit(
            const CommentError(errorMassage: 'Заполните все поля'),
          );
        }
      },
    );
  }
}
