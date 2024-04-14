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

final testInfo1 = Info(next: null);

final testCharacters1 =
    Characters(info: testInfo1, results: testCharacterInfoList1);

final testCharacterInfoData1 = CharacterInfoData(characters: testCharacters1);
