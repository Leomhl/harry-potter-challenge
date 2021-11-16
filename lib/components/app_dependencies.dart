import 'package:flutter/cupertino.dart';

import '../database/character_dao.dart';
import '../http/webclient.dart';

class AppDependencies extends InheritedWidget {
  final CharacterDao characterDao;
  final CharacterWebClient characterWebClient;
  final Widget child;

  AppDependencies(
      {required this.characterDao,
      required this.characterWebClient,
      required this.child})
      : super(child: child);

  static AppDependencies of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<AppDependencies>()!;
  }

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return characterDao != oldWidget.characterDao || characterWebClient != characterWebClient;
  }
}
