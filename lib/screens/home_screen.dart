import 'package:flutter/material.dart';
import 'package:harry_potter_challenge/models/character.dart';
import 'package:harry_potter_challenge/screens/character_screen.dart';

class HomeScreen extends StatelessWidget {


  // TODO: Trazer estes dados da api
  List items = [
    Character(
      name: "Harry Potter",
      image: "http://hp-api.herokuapp.com/images/harry.jpg",
      house: "Gryffindor",
      actor: "Daniel Radcliffe",
      hogwartsStudent: true,
      dateOfBirth: "31-07-1980",
      eyeColour: "green"
    ),
    Character(
        name: "Harry Potter",
        image: "http://hp-api.herokuapp.com/images/harry.jpg",
        house: "Gryffindor",
        actor: "Daniel Radcliffe",
        hogwartsStudent: true,
        dateOfBirth: "31-07-1980",
        eyeColour: "green"
    ),
    Character(
        name: "Harry Potter",
        image: "http://hp-api.herokuapp.com/images/harry.jpg",
        house: "Gryffindor",
        actor: "Daniel Radcliffe",
        hogwartsStudent: true,
        dateOfBirth: "31-07-1980",
        eyeColour: "green"
    ),
    Character(
        name: "Harry Potter",
        image: "http://hp-api.herokuapp.com/images/harry.jpg",
        house: "Gryffindor",
        actor: "Daniel Radcliffe",
        hogwartsStudent: true,
        dateOfBirth: "31-07-1980",
        eyeColour: "green"
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
          'Harry Challenge',
            style: TextStyle(
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image.asset(
          "assets/images/harry_bg.jpg",
          fit: BoxFit.fitWidth,
          width: double.infinity,
          height: 200,
        ),

        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListTile(
                  title: Text(items[index].name),
                  subtitle: Text(items[index].house),
                  onTap: (){
                    print("Apertou no ${items[index].name}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CharacterScreen(character: items[index])),
                    );
                  },
                ),
              );
            }
          ),
        )
      ])
    );
  }
}