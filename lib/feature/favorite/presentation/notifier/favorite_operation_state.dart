part of 'favorite_operation_notifier.dart';

class FavoriteOperationState extends Equatable {
  final bool isAdded;

  const FavoriteOperationState({required this.isAdded});

  @override
  List<Object?> get props => [isAdded];

  FavoriteOperationState copyWith({
    bool? isAdded,
  }) {
    return FavoriteOperationState(
      isAdded: isAdded ?? this.isAdded,
    );
  }
}
