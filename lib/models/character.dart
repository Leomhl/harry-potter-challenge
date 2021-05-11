import 'package:flutter/material.dart';

class Character {
  String name;
  String house;
  String dateOfBirth;
  String eyeColour;
  bool hogwartsStudent;
  String actor;
  String image;
  int liked;

  Character({
    this.actor,
    this.hogwartsStudent,
    this.house,
    this.dateOfBirth,
    this.eyeColour,
    this.name,
    this.image,
    this.liked
  });
}