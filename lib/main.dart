import 'package:flutter/material.dart';
import 'package:harry_potter_challenge/components/app_dependencies.dart';
import 'package:harry_potter_challenge/screens/home_screen.dart';
import 'package:harry_potter_challenge/database/character_dao.dart';
import 'package:harry_potter_challenge/http/webclient.dart';

void main() {
  runApp(MyApp(
    characterDao: CharacterDao(),
    characterWebClient: CharacterWebClient(),
  ));
}

class MyApp extends StatelessWidget {
  final CharacterDao characterDao;
  final CharacterWebClient characterWebClient;

  MyApp({@required this.characterDao, @required this.characterWebClient});

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      characterDao: characterDao,
      characterWebClient: characterWebClient,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Harry Challenge',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
