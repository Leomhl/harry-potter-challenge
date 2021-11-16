import 'package:sqflite/sqflite.dart';
import 'package:harry_potter_challenge/models/character.dart';
import 'package:harry_potter_challenge/database/app_database.dart';

class CharacterDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT UNIQUE, '
      '$_liked INTEGER)';
  static const String _tableName = 'characters';
  static const String _name = 'name';
  static const String _liked = 'liked';

  save(Character character) async {
    final Database db = await getDatabase();
    var itemExists = await find(character.name);
    Map<String, dynamic> characterMap = _toMap(character);

    if (itemExists.length == 0) return db.insert(_tableName, characterMap);

    return await db.update(_tableName, characterMap,
        where: '$_name = ?', whereArgs: [character.name]);
  }

  Future<List<Character>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    return _toList(result);
  }

  Future<List<Character>> find(String name) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tableName, where: '$_name = ?', whereArgs: [name]);

    return _toList(result);
  }

  Map<String, dynamic> _toMap(Character character) {
    final Map<String, dynamic> characterMap = Map();
    characterMap[_name] = character.name;
    characterMap[_liked] = character.liked;

    return characterMap;
  }

  List<Character> _toList(List<Map<String, dynamic>> result) {
    final List<Character> characters = [];
    for (Map<String, dynamic> row in result) {
      final Character character = Character(
        name: row[_name],
        liked: row[_liked],
      );

      characters.add(character);
    }

    return characters;
  }
}
