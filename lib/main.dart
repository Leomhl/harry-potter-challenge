import 'package:flutter/material.dart';
import 'package:harry_potter_challenge/http/featureclient.dart';
import 'package:harry_potter_challenge/screens/home_screen.dart';

void main() {
  runApp(MyApp());
  findAllFeatures().then((features) => print('Features: $features'));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harry Challenge',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomeScreen(),
    );
  }
}

