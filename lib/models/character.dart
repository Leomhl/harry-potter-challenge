import 'package:flutter/material.dart';

class Character {
  String name;
  String house;
  String dateOfBirth;
  String eyeColour;
  bool hogwartsStudent;
  String actor;
  String image;

  Character({
    @required this.actor,
    @required this.hogwartsStudent,
    @required this.house,
    @required this.dateOfBirth,
    @required this.eyeColour,
    @required this.name,
    @required this.image
  });
}