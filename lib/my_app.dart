import 'package:calley/core/router/router.dart';
import 'package:calley/core/router/string_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StringRouter.selectLanguage,
      onGenerateRoute: RouterApp.generateRoute,
    );
  }
}