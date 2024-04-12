part of 'home_notifier.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CharacterInfo> data;

  HomeLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);

  @override
  List<Object?> get props => [message];
}
