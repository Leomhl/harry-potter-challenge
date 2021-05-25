
import 'package:flutter_test/flutter_test.dart';

import '../../lib/models/character.dart';

void main (){
  test('Test_Character_Name', (){
    final charactertest = Character(name: 'Harry');
    expect(charactertest.name, 'Harry');
  });
  test('Test_Character_Actor', (){
    final charactertest = Character(actor: 'Daniel Radcliffe');
    expect(charactertest.actor, 'Daniel Radcliffe');
  });
  test('Test_Character_House', (){
    final charactertest = Character(house: 'Gryffindor');
    expect(charactertest.house, 'Gryffindor');
  });
  test('Test_Character_Liked', (){
    final charactertest = Character(liked: 1);
    expect(charactertest.liked, 1);
  });
}