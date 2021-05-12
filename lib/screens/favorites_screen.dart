import 'package:flutter/material.dart';
import 'package:harry_potter_challenge/database/character_dao.dart';
import 'package:harry_potter_challenge/http/webclient.dart';
import 'package:harry_potter_challenge/models/character.dart';
import 'package:harry_potter_challenge/screens/character_screen.dart';

class FavoriteScreen extends StatelessWidget {
  final CharacterDao _dao = CharacterDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Personagens Favoritos',
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
              future: _dao.findAll(),
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
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  child: ListTile(
                                    title: Text(items[index].name, style: TextStyle(fontSize: 20),),
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
    );
  }
}
