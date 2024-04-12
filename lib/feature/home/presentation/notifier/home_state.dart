part of 'home_notifier.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CharacterInfo> data;
  final bool canLoad;
  final int? next;

  HomeLoaded(this.data, this.canLoad, this.next);

  @override
  List<Object?> get props => [data];
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);

  @override
  List<Object?> get props => [message];
}
