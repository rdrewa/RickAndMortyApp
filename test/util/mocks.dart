import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';

import 'package:rick_morty_app/feature/common/data/source/remote/rick_service.dart';
import 'package:rick_morty_app/feature/common/domain/repository/character_repository.dart';
import 'package:rick_morty_app/feature/common/domain/repository/favorite_repository.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/add_to_favorite_usecase.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/get_character_details_usecase.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/is_on_favorite_usecase.dart';
import 'package:rick_morty_app/feature/details/domain/usecase/remove_from_favorite_usecase.dart';
import 'package:rick_morty_app/feature/favorite/domain/usecase/get_favorite_list_usecase.dart';
import 'package:rick_morty_app/feature/home/domain/usecase/get_character_list_usecase.dart';

@GenerateNiceMocks([
  MockSpec<RickGraphService>(),
  MockSpec<GraphQLClient>(),
  MockSpec<CharacterRepository>(),
  MockSpec<FavoriteRepository>(),
  MockSpec<GetCharacterListUsecase>(),
  MockSpec<GetCharacterDetailsUsecase>(),
  MockSpec<GetFavoriteListUsecase>(),
  MockSpec<IsOnFavoriteUsecase>(),
  MockSpec<AddToFavoriteUsecase>(),
  MockSpec<RemoveFromFavoriteUsecase>(),
])
void mocks() {}
