import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../home/data/model/character_info_data.dart';
import '../../../../details/data/model/character_details_data.dart';
import 'graph_client.dart';
import 'queries.dart';

part 'rick_service.g.dart';

abstract class RickService {
  Future<CharacterInfoData?> getCharacterList(int page);
  Future<CharacterDetailsData?> getCharacterDetails(int id);
}

@riverpod
RickService rickService(RickServiceRef ref) =>
    RickGraphService(ref.watch(graphClientProvider));

class RickGraphService implements RickService {
  final GraphQLClient client;

  RickGraphService(this.client);

  @override
  Future<CharacterInfoData?> getCharacterList(int page) async {
    try {
      QueryResult result = await client.query(QueryOptions(
          document: gql(Queries.characterList), variables: {'page': page}));
      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        log(result.data.toString());
        return CharacterInfoData.fromJson(result.data!);
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<CharacterDetailsData?> getCharacterDetails(int id) async {
    try {
      QueryResult result = await client.query(QueryOptions(
          document: gql(Queries.characterDetails), variables: {'id': id}));
      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        log(result.data.toString());
        return CharacterDetailsData.fromJson(result.data!);
      }
    } on Exception {
      rethrow;
    }
  }
}
