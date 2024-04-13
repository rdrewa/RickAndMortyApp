import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/app/config.dart';

part 'graph_client.g.dart';

@riverpod
GraphQLClient graphClient(GraphClientRef graphClient) =>
    GraphQLClient(link: HttpLink(Config.link), cache: GraphQLCache());
