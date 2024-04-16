import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../home/domain/model/character_info.dart';
import '../../domain/usecase/get_favorite_list_usecase.dart';

part 'favorite_list_state.dart';

part 'favorite_list_notifier.g.dart';

@riverpod
class FavoriteListNotifier extends _$FavoriteListNotifier {
  late final GetFavoriteListUsecase _getFavoriteListUsecase =
      ref.watch(getFavoriteListUsecaseProvider);

  @override
  FavoriteListState build() => FavoriteListInitial();

  Future<void> getFavoriteList() async {
    await Future.delayed(Duration.zero);
    state = FavoriteListLoading();

    (await _getFavoriteListUsecase()).fold(
        (fail) => state = FavoriteListFailure(fail.message),
        (data) => state =
            data.isEmpty ? FavoriteListEmpty() : FavoriteListLoaded(data));
  }
}
