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
    int page = 1;
    HomeLoaded? stateLoaded;
    await Future.delayed(Duration.zero);

    if (state is HomeLoaded) {
      stateLoaded = state as HomeLoaded;
      if (!stateLoaded.canLoad) {
        state = HomeLoaded(stateLoaded.data, false, null);
        return;
      }
      if (stateLoaded.next != null) {
        page = stateLoaded.next!;
      }
    }

    state = HomeLoading();

    (await _getCharacterListUsecase(page)).fold((fail) {
      state = HomeFailure(fail.message);
    }, (data) {
      final int? next = data.info.next;
      final bool canLoad = next != null;
      final List<CharacterInfo> results = stateLoaded != null
          ? [...stateLoaded.data, ...data.results]
          : data.results;
      state = HomeLoaded(results, canLoad, next);
    });
  }
}
