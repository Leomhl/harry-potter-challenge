import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:harry_potter_challenge/database/character_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'harry.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(CharacterDao.tableSql);
    },
    version: 1,
  );
}