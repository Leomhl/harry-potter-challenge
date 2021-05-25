import 'dart:convert';
import 'package:harry_potter_challenge/models/character.dart';
import 'package:http/http.dart';

class CharacterWebClient{
  Future<List<Character>> findAll() async {
    var url = Uri.parse('https://hp-api.herokuapp.com/api/characters');
    final Response response = await get(url);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Character> characters = [];
    for (Map<String, dynamic> element in decodedJson) {
      final Character character = Character(
        name: element['name'],
        hogwartsStudent: element['hogwartsStudent'],
        house: element['house'],
        dateOfBirth: element['dateOfBirth'],
        eyeColour: element['eyeColour'],
        actor: element['actor'],
        image: element['image'],
      );
      characters.add(character);
    }
    return characters;
  }
}
