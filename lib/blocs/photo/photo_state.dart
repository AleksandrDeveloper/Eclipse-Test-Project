part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<Photo> photos;
  const PhotoLoaded({required this.photos});
  @override
  List<Object> get props => [photos];
}

class PhotoError extends PhotoState {
  final String errorMassage;
  const PhotoError({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
