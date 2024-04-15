import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../../../../favorite/data/model/favorite.dart';

part 'rick_database.g.dart';

@riverpod
RickDatabase rickDatabase(RickDatabaseRef ref) => RickDatabase();

@DriftDatabase(tables: [Favorite])
class RickDatabase extends _$RickDatabase {
  RickDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<FavoriteData>> getFavoriteList() async =>
      await select(favorite).get();

  Future<FavoriteData?> getFavorite(int id) async =>
      await (select(favorite)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<bool> updateFavorite(FavoriteCompanion companion) async =>
      await update(favorite).replace(companion);

  Future<int> insertFavorite(FavoriteCompanion companion) async =>
      await into(favorite).insert(companion);

  Future<int> deleteFavorite(int id) async =>
      await (delete(favorite)..where((tbl) => tbl.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'rick.db'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    return NativeDatabase.createInBackground(file, logStatements: kDebugMode);
  });
}
