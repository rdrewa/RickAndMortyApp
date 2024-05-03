import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:rick_morty_app/feature/common/data/source/local/rick_database.dart';
import 'package:rick_morty_app/feature/home/domain/model/character_info.dart';

import '../../../../util/data.dart';
import '../../../../util/fixture.dart';

void main() {
  test('Should return a valid model CharacterInfo from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('character_info'));

    // act
    final result = CharacterInfo.fromJson(jsonMap);

    // assert
    expect(result, equals(testCharacterInfo1));
  });

  test('Should return a valid model JSON map from object', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('character_info'));

    // act
    final Map<String, dynamic> result = testCharacterInfo1.toJson();

    // assert
    expect(result, equals(jsonMap));
  });

  test('Should return a valid JSON map from object ', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('character_info'));

    // act
    final Map<String, dynamic> result = testCharacterInfo1.toJson();

    // assert
    expect(result, equals(jsonMap));
  });

  test('Should return a valid model CharacterInfo from FavoriteData object',
      () async {
    // arrange
    const FavoriteData favoriteData = FavoriteData(
        id: 2,
        name: 'Morty',
        status: 'Alive',
        image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
        species: 'Human');

    // act
    final result = CharacterInfo.fromFavorite(favoriteData);

    // assert
    expect(result, equals(isA<CharacterInfo>()));
    expect(int.parse(result.id), equals(favoriteData.id));
    expect(result.name, equals(favoriteData.name));
    expect(result.status, equals(favoriteData.status));
    expect(result.image, equals(favoriteData.image));
    expect(result.species, equals(favoriteData.species));
  });

  test('Should return a valid model FavoriteCompanion from object', () async {
    // arrange / act
    final result = testCharacterInfo1.toFavoriteCompanion();

    // assert
    expect(result, equals(isA<FavoriteCompanion>()));
    expect(result.id, equals(favoriteCompanion1.id));
    expect(result.name, equals(favoriteCompanion1.name));
    expect(result.status, equals(favoriteCompanion1.status));
    expect(result.image, equals(favoriteCompanion1.image));
    expect(result.species, equals(favoriteCompanion1.species));
  });

  test('Should return a valid model FavoriteData from object', () async {
    // arrange / act
    final result = testCharacterInfo1.toFavoriteData();

    // assert
    expect(result, equals(isA<FavoriteData>()));
    expect(result.id, equals(favoriteData1.id));
    expect(result.name, equals(favoriteData1.name));
    expect(result.status, equals(favoriteData1.status));
    expect(result.image, equals(favoriteData1.image));
    expect(result.species, equals(favoriteData1.species));
  });

  test('Should return a valid model CharacterInfo from CharacterDetails',
      () async {
    // arrange / act
    final result = CharacterInfo.fromDetails(testCharacterDetails1);

    // assert
    expect(result, equals(isA<CharacterInfo>()));
    expect(result.id, equals(testCharacterDetails1.id));
    expect(result.name, equals(testCharacterDetails1.name));
    expect(result.status, equals(testCharacterDetails1.status));
    expect(result.image, equals(testCharacterDetails1.image));
    expect(result.species, equals(testCharacterDetails1.species));
  });
}
