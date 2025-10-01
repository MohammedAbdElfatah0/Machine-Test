import 'package:calley/core/router/string_router.dart';
import 'package:flutter/material.dart';

class RouterApp {
    static Route<dynamic> generateRoute(RouteSettings settings) {
        switch (settings.name) {
          case StringRouter.selectLanguage:
            return MaterialPageRoute(builder: (_) => const Scaffold());
          //problem in router
          default:
            return MaterialPageRoute(builder: (_) => const Scaffold());
        }
    }
}
