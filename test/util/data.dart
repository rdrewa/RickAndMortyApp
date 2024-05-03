import 'package:drift/drift.dart';
import 'package:rick_morty_app/feature/common/data/source/local/rick_database.dart';
import 'package:rick_morty_app/feature/details/data/model/character_details_data.dart';
import 'package:rick_morty_app/feature/details/domain/model/character_details.dart';
import 'package:rick_morty_app/feature/details/domain/model/episode.dart';
import 'package:rick_morty_app/feature/details/domain/model/location.dart';
import 'package:rick_morty_app/feature/details/domain/model/origin.dart';
import 'package:rick_morty_app/feature/home/data/model/character_info_data.dart';
import 'package:rick_morty_app/feature/home/data/model/characters.dart';
import 'package:rick_morty_app/feature/home/data/model/info.dart';
import 'package:rick_morty_app/feature/home/domain/model/character_info.dart';

const testCharacterInfo1 = CharacterInfo(
    name: 'Rick Sanchez',
    id: '1',
    status: 'Alive',
    image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    species: 'Human');

const testCharacterInfo2 = CharacterInfo(
    name: 'Morty Smith',
    id: '2',
    status: 'Alive',
    image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
    species: 'Human');

const testCharacterInfo3 = CharacterInfo(
    name: 'Summer Smith',
    id: '3',
    status: 'Alive',
    image: 'https://rickandmortyapi.com/api/character/avatar/3.jpeg',
    species: 'Human');

final testCharacterInfoList1 = [
  testCharacterInfo1,
  testCharacterInfo2,
  testCharacterInfo3
];

const testInfo1 = Info(next: null);

final testCharacters1 =
    Characters(info: testInfo1, results: testCharacterInfoList1);

final testCharacterInfoData1 = CharacterInfoData(characters: testCharacters1);

final testOrigin1 = Origin(
    name: 'Earth (C-137)', created: DateTime.parse('2017-11-10T12:42:04.162Z'));

const testEpisode1 = Episode(id: "1", title: "Pilot", number: "S01E01");
const testEpisode2 = Episode(id: "2", title: "Lawnmower Dog", number: "S01E02");

final testEpisodeList1 = [testEpisode1, testEpisode2];

const testLocation1 = Location(name: 'Citadel of Ricks', dimension: 'unknown');

final testCharacterDetails1 = CharacterDetails(
    name: 'Rick Sanchez',
    id: '1',
    status: 'Alive',
    type: '',
    image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    species: 'Human',
    gender: 'Male',
    origin: testOrigin1,
    episode: testEpisodeList1,
    location: testLocation1);

final testCharacterDetailsData1 =
    CharacterDetailsData(characterDetails: testCharacterDetails1);

final favoriteCompanion1 = FavoriteCompanion(
    id: Value(int.parse(testCharacterInfo1.id)),
    name: Value(testCharacterInfo1.name),
    status: Value(testCharacterInfo1.status),
    image: Value(testCharacterInfo1.image),
    species: Value(testCharacterInfo1.species));

final favoriteData1 = FavoriteData(
    id: int.parse(testCharacterInfo1.id),
    name: testCharacterInfo1.name,
    status: testCharacterInfo1.status,
    image: testCharacterInfo1.image,
    species: testCharacterInfo1.species);
