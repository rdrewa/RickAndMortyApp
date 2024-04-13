import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/error/failure.dart';
import '../../../home/data/model/characters.dart';
import '../../../details/domain/model/character_details.dart';
import '../../data/repository/character_graph_repository.dart';
part 'character_repository.g.dart';

@riverpod
CharacterRepository characterRepository(CharacterRepositoryRef ref) =>
    ref.watch(characterGraphRepositoryProvider);

abstract class CharacterRepository {
  Future<Either<Failure, Characters>> getCharacterList(int page);
  Future<Either<Failure, CharacterDetails>> getCharacterDetaisl(int id);
}
