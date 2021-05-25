import 'package:flutter/material.dart';
import 'package:harry_potter_challenge/components/app_dependencies.dart';

import 'package:harry_potter_challenge/models/character.dart';
import 'package:harry_potter_challenge/screens/character_screen.dart';
import '../http/webclient.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatelessWidget {
  final CharacterWebClient webClient = CharacterWebClient();
  @override
  Widget build(BuildContext context) {
    final dependencies = AppDependencies.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Harry Challenge',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            "assets/images/harry_bg.jpg",
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: 200,
          ),
          Expanded(
            child: FutureBuilder<List<Character>>(
              future: dependencies.characterWebClient.findAll(),
              builder: (context, snapshot) {
                final List<Character> items = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    return  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando')
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      if (items.isNotEmpty) {
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              Color houseColors() {
                                Color houseColor = Colors.black;
                                if(items[index].house == 'Gryffindor'){
                                  houseColor = Color.fromRGBO(174, 0, 1, 1);
                                }
                                if(items[index].house == 'Slytherin'){
                                  houseColor = Color.fromRGBO(26, 71, 42, 1);;
                                }
                                if(items[index].house == 'Hufflepuff'){
                                  houseColor = Color.fromRGBO(236, 185, 57, 1);;
                                }
                                if(items[index].house == 'Ravenclaw'){
                                  houseColor = Color.fromRGBO(34, 47, 91, 1);;
                                }
                                return houseColor;
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  shadowColor: houseColors(),
                                  elevation: 5,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(items[index].image),
                                      radius: 20,
                                    ),
                                    title: Text(items[index].name, style: TextStyle(fontSize: 20),),
                                    subtitle: Text(items[index].house, style: TextStyle(fontSize: 16)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CharacterScreen(character: items[index])),
                                      );
                                    },
                                  ),
                                ),
                              );
                            });
                      }
                    }
                    return Text('Erro ao carregar personagens');
                }

                return Text('Erro');
              },
            ),
          ),
        ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.favorite,),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FavoriteScreen()),
          );
        },
      ),
    );
  }
}
