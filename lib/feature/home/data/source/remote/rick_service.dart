import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../common/data/source/remote/graph_client.dart';
import '../../model/data.dart';

part 'rick_service.g.dart';

abstract class RickService {
  Future<Data?> getCharacterList(int page);
}

@riverpod
RickService rickService(RickServiceRef ref) =>
    RickGraphService(ref.watch(graphClientProvider));

class RickGraphService implements RickService {
  final GraphQLClient client;

  RickGraphService(this.client);

  @override
  Future<Data?> getCharacterList(int page) async {
    try {
      QueryResult result = await client.query(QueryOptions(document: gql("""
           query getCharacterList(\$page: Int) {
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
        return Data.fromJson(result.data!);
      }
    } on Exception {
      rethrow;
    }
  }
}
