import 'package:calley/core/router/router.dart';
import 'package:calley/core/router/string_router.dart';
import 'package:flutter/material.dart';
import 'core/style/color_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.background,
        cardTheme: const CardTheme(color: ColorManager.surface),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: StringRouter.selectLanguage,
      onGenerateRoute: RouterApp.generateRoute,
    );
  }
}
