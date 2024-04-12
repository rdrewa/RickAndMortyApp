import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/characters.dart';
import '../repository/character_repository.dart';

part 'get_character_list_usecase.g.dart';

@riverpod
GetCharacterListUsecase getCharacterListUsecase(
        GetCharacterListUsecaseRef ref) =>
    GetCharacterListUsecase(ref.watch(characterRepositoryProvider));

class GetCharacterListUsecase {
  final CharacterRepository _repository;

  GetCharacterListUsecase(this._repository);

  Future<Either<Failure, Characters>> call(int page) =>
      _repository.getCharacterList(page);
}
