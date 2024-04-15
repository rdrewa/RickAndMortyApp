import 'package:drift/drift.dart';

class Favorite extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get status => text()();
  TextColumn get image => text()();
  TextColumn get species => text()();
}
