part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> comments;
  const CommentLoaded({required this.comments});
  @override
  List<Object> get props => [comments];
}

class CommentError extends CommentState {
  final String errorMassage;
  const CommentError({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
