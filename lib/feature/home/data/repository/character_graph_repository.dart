import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '/core/error/failure.dart';
import '../../domain/model/character_info.dart';
import '../../domain/repository/character_repository.dart';
import '../source/remote/rick_service.dart';
import '../model/data.dart';

part 'character_graph_repository.g.dart';

@riverpod
CharacterGraphRepository characterGraphRepository(
        CharacterGraphRepositoryRef ref) =>
    CharacterGraphRepository(ref.watch(rickServiceProvider));

class CharacterGraphRepository implements CharacterRepository {
  final RickService _service;

  CharacterGraphRepository(this._service);

  @override
  Future<Either<Failure, List<CharacterInfo>>> getCharacterList() async {
    try {
      final Data? data = await _service.getCharacterList(1);

      if (data == null) {
        return const Left(ServerFailure('Server Failure: null ResponseData'));
      } else {
        return Right(data.characters.results);
      }
    } on OperationException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
