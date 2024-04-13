import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '/core/error/failure.dart';
import '../../domain/repository/character_repository.dart';
import '../../../home/data/model/character_info_data.dart';
import '../../../home/data/model/characters.dart';
import '../source/remote/rick_service.dart';

part 'character_graph_repository.g.dart';

@riverpod
CharacterGraphRepository characterGraphRepository(
        CharacterGraphRepositoryRef ref) =>
    CharacterGraphRepository(ref.watch(rickServiceProvider));

class CharacterGraphRepository implements CharacterRepository {
  final RickService _service;

  CharacterGraphRepository(this._service);

  @override
  Future<Either<Failure, Characters>> getCharacterList(int page) async {
    try {
      final CharacterInfoData? data = await _service.getCharacterList(page);

      if (data == null) {
        return const Left(ServerFailure('Server Failure: null ResponseData'));
      } else {
        return Right(data.characters);
      }
    } on OperationException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
