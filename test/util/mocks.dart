import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';

import 'package:rick_morty_app/feature/common/data/source/remote/rick_service.dart';

@GenerateNiceMocks([MockSpec<RickGraphService>(), MockSpec<GraphQLClient>()])
void mocks() {}
