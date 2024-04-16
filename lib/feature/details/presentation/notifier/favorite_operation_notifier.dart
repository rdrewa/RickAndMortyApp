import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../home/domain/model/character_info.dart';
import '../../domain/usecase/add_to_favorite_usecase.dart';
import '../../domain/usecase/is_on_favorite_usecase.dart';
import '../../domain/usecase/remove_from_favorite_usecase.dart';

part 'favorite_operation_state.dart';

part 'favorite_operation_notifier.g.dart';

@riverpod
class FavoriteOperationNotifier extends _$FavoriteOperationNotifier {
  late final IsOnFavoriteUsecase _isOnFavoriteUsecase =
      ref.watch(isOnFavoriteUsecaseProvider);
  late final AddToFavoriteUsecase _addToFavoriteUsecase =
      ref.watch(addToFavoriteUsecaseProvider);
  late final RemoveFromFavoriteUsecase _removeFromFavoriteUsecase =
      ref.watch(removeFromFavoriteUsecaseProvider);

  @override
  FavoriteOperationState build() =>
      const FavoriteOperationState(isAdded: false);

  Future<void> isOnList(CharacterInfo item) async {
    (await _isOnFavoriteUsecase(item)).fold(
        (fail) => null, (added) => state = state.copyWith(isAdded: added));
  }

  Future<void> addToList(CharacterInfo item) async {
    (await _addToFavoriteUsecase(item))
        .fold((fail) => null, (added) => state = state.copyWith(isAdded: true));
  }

  Future<void> removeFromList(CharacterInfo item) async {
    (await _removeFromFavoriteUsecase(item)).fold(
        (fail) => null, (added) => state = state.copyWith(isAdded: false));
  }
}
