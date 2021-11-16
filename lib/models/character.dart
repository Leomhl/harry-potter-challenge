class Character {
  final String name;
  String? house;
  String? dateOfBirth;
  String? eyeColour;
  bool? hogwartsStudent;
  String? actor;
  String? image;
  int? liked;

  Character(
      {this.actor,
      this.hogwartsStudent,
      this.house,
      this.dateOfBirth,
      this.eyeColour,
      required this.name,
      this.image,
      this.liked});

  @override
  String toString() {
    return 'Characters {name: $name ,hogwartsStudent: $hogwartsStudent ,contact: $house ,dateOfBirth: $dateOfBirth ,eyeColour $eyeColour ,actor: $actor ,image: $image }';
  }
}
