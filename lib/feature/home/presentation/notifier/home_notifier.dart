import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecase/get_character_list_usecase.dart';
import '../../domain/model/character_info.dart';

part 'home_state.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  late final GetCharacterListUsecase _getCharacterListUsecase =
      ref.watch(getCharacterListUsecaseProvider);

  @override
  HomeState build() => HomeInitial();

  Future<void> getCharacterList() async {
    final bool isLoadingMore = state is HomeLoaded;
    final int page = isLoadingMore ? (state as HomeLoaded).next ?? 1 : 1;
    List<CharacterInfo> list = [];

    await Future.delayed(Duration.zero);

    if (isLoadingMore) {
      list = (state as HomeLoaded).data;
    } else {
      state = HomeLoading();
    }

    (await _getCharacterListUsecase(page)).fold((fail) {
      state = HomeFailure(fail.message);
    }, (data) {
      final int? next = data.info.next;
      final bool canLoad = next != null;
      if (isLoadingMore) {
        list.addAll(data.results);
      } else {
        list = data.results;
      }

      state = HomeLoaded(list, canLoad, next);
    });
  }
}
