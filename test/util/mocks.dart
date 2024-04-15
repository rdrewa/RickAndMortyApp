import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';

import 'package:rick_morty_app/feature/common/data/source/remote/rick_service.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/get_character_details_usecase.dart';
import 'package:rick_morty_app/feature/home/domain/usecase/get_character_list_usecase.dart';

@GenerateNiceMocks([
  MockSpec<RickGraphService>(),
  MockSpec<GraphQLClient>(),
  MockSpec<GetCharacterListUsecase>(),
  MockSpec<GetCharacterDetailsUsecase>()
])
void mocks() {}
