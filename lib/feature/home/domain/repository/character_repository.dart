import 'package:dartz/dartz.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/error/failure.dart';
import '../../data/repository/character_graph_repository.dart';
import '../model/character_info.dart';

part 'character_repository.g.dart';

@riverpod
CharacterRepository characterRepository(CharacterRepositoryRef ref) =>
    ref.watch(characterGraphRepositoryProvider);

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterInfo>>> getCharacterList();
}
