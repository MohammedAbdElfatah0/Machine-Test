import 'package:calley/core/router/string_router.dart';
import 'package:calley/feature/select_language/presentation/screen/select_language.dart';
import 'package:flutter/material.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringRouter.selectLanguage:
        return MaterialPageRoute(builder: (_) => const SelectLanguage());
      //problem in router
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
