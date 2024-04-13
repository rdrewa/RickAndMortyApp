import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graph_client.dart';
import '../../../../home/data/model/character_info_data.dart';

part 'rick_service.g.dart';

abstract class RickService {
  Future<CharacterInfoData?> getCharacterList(int page);
  Future<CharacterInfoData?> getCharacterDetails(int id);
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
      QueryResult result = await client.query(QueryOptions(document: gql("""
           query characters(\$page: Int) {
              characters(page: \$page) {
                info {
                  next
                }
                results {
                  name
                  id
                  status
                  image
                  species
                }
              }
            }
            """), variables: {'page': page}));
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
  Future<CharacterInfoData?> getCharacterDetails(int id) async {
    try {
      QueryResult result = await client.query(QueryOptions(document: gql("""
           query characters(\$id: Int) {
              character(id: \$id) {
                name
                id
                status
                type
                image
                species
                origin {
                  name
                  created
                }
                episode {
                  id
                  name
                  episode
                }
                location {
                  name
                  dimension
                }
              }
            }
            """), variables: {'id': id}));
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
}
