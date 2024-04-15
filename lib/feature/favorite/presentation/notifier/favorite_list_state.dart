part of 'favorite_list_notifier.dart';

sealed class FavoriteListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteListInitial extends FavoriteListState {}

class FavoriteListEmpty extends FavoriteListState {}

class FavoriteListLoading extends FavoriteListState {}

class FavoriteListLoaded extends FavoriteListState {
  final List<CharacterInfo> data;

  FavoriteListLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class FavoriteListFailure extends FavoriteListState {
  final String message;

  FavoriteListFailure(this.message);

  @override
  List<Object?> get props => [message];
}
