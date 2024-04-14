part of 'details_notifier.dart';

sealed class DetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final CharacterDetails data;

  DetailsLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class DetailsFailure extends DetailsState {
  final String message;

  DetailsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
