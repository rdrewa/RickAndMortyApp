import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/character_details.dart';
import '../../domain/usecase/get_character_details_usecase.dart';

part 'details_state.dart';

part 'details_notifier.g.dart';

@riverpod
class DetailsNotifier extends _$DetailsNotifier {
  late final GetCharacterDetailsUsecase _getCharacterDetailsUsecase =
      ref.watch(getCharacterDetailsUsecaseProvider);

  @override
  DetailsState build() => DetailsInitial();

  Future<void> getCharacterDetails(int id) async {
    await Future.delayed(Duration.zero);
    state = DetailsLoading();

    (await _getCharacterDetailsUsecase(id)).fold(
        (fail) => state = DetailsFailure(fail.message),
        (data) => state = DetailsLoaded(data));
  }
}
