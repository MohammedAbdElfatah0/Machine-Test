import 'package:calley/core/router/string_router.dart';
import 'package:calley/feature/auth/log_in/presentation/screen/log_in.dart';
import 'package:calley/feature/auth/otp/presentation/screen/otp.dart';
import 'package:calley/feature/auth/register/presentation/screen/register_screen.dart';
import 'package:calley/feature/select_language/presentation/screen/select_language.dart';
import 'package:flutter/material.dart';

import '../../feature/home/presentation/screen/home.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringRouter.selectLanguage:
        return MaterialPageRoute(builder: (_) => const SelectLanguage());
      case StringRouter.signUp:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case StringRouter.signIn:
        return MaterialPageRoute(builder: (_) => const LogIn());
      case StringRouter.otpWhatsApp:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
          settings: settings,
        );
      case StringRouter.home:
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      //problem in router
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
