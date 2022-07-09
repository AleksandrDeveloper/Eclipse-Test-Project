part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class GetComment extends CommentEvent {}

class PostComment extends CommentEvent {
  final String name;
  final String email;
  final String body;
  final int postId;

  const PostComment({
    required this.postId,
    required this.body,
    required this.email,
    required this.name,
  });

  @override
  List<Object> get props => [
        body,
        email,
        name,
        postId,
      ];
}
