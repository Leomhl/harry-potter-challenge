import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/screens/home_screen.dart';

void main() {
  testWidgets('Show_One_Image_On_HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });
  testWidgets('Show_FloatingActionButton', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));
    final favoriteButton =
        find.widgetWithIcon(FloatingActionButton, Icons.favorite);
    expect(favoriteButton, findsOneWidget);
  });
}
