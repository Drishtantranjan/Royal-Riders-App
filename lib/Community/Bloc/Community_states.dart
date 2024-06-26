import 'package:equatable/equatable.dart';

abstract class CarouselState extends Equatable {
  const CarouselState();

  @override
  List<Object> get props => [];
}

class CarouselInitial extends CarouselState {}

class CarouselLoading extends CarouselState {}

class CarouselLoaded extends CarouselState {
  final List<String> images;

  const CarouselLoaded(this.images);

  @override
  List<Object> get props => [images];
}

class CarouselError extends CarouselState {
  final String message;

  const CarouselError(this.message);

  @override
  List<Object> get props => [message];
}
