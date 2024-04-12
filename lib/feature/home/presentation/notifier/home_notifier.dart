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
    await Future.delayed(Duration.zero);
    state = HomeLoading();

    (await _getCharacterListUsecase()).fold((fail) {
      state = HomeFailure(fail.message);
    }, (data) {
      state = HomeLoaded(data);
    });
  }
}
