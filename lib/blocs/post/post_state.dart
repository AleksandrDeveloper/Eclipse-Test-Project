part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  const PostLoaded({required this.posts});
  @override
  List<Object> get props => [posts];
}

class PostError extends PostState {
  final String errorMassage;
  const PostError({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
