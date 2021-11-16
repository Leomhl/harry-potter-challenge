import 'package:flutter/material.dart';
import 'package:harry_potter_challenge/components/app_dependencies.dart';
import 'package:harry_potter_challenge/models/character.dart';



class FavoriteScreen extends StatelessWidget {
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
            future: dependencies.characterDao.findAll(),
            builder: (context, snapshot) {
              final List<Character>? items = snapshot.data;
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
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    if (items!.isNotEmpty) {
                      final likedCharacters = items.where((c) => c.liked == 1).toList();
                      return ListView.builder(
                          itemCount: likedCharacters.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Character character = likedCharacters[index];
                            return CharacterItem(character);
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
class CharacterItem extends StatelessWidget {
  final Character character;

  CharacterItem(this.character);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: ListTile(
          title: Text(character.name, style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
