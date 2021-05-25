import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:harry_potter_challenge/main.dart';
import 'package:harry_potter_challenge/screens/home_screen.dart';
import 'package:harry_potter_challenge/models/character.dart';
import 'package:harry_potter_challenge/screens/favorite_screen.dart';
import '../mocks/MockCharacterDao.dart';
import '../mocks/MockCharacterWebClient.dart';



void main() {
  testWidgets('Navigation_Favorite', (tester) async {

    final mockCharacterDao = MockCharacterDao();
    final mockCharacterWebClient = MockCharacterWebClient();
    await tester.pumpWidget(MyApp(
      characterDao: mockCharacterDao,
      characterWebClient: mockCharacterWebClient,
    ));

    verify(mockCharacterWebClient.findAll()).called(1);

    final homeScreen = find.byType(HomeScreen);
    expect(homeScreen, findsOneWidget);

    final fabFavorite = find.widgetWithIcon(FloatingActionButton, Icons.favorite);
    expect(fabFavorite, findsOneWidget);

    when(mockCharacterDao.findAll()).thenAnswer((realInvocation) async {
      return [Character(name: 'Cedric Diggory')];
    });

    await tester.tap(fabFavorite);
    await tester.pumpAndSettle();

    verify(mockCharacterDao.findAll()).called(1);

    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);

    final characterItem = find.byWidgetPredicate((widget) {
      if (widget is CharacterItem) {
        return widget.character.name == 'Cedric Diggory';
      }
      return false;
    });
    expect(characterItem, findsOneWidget);


  });
}
