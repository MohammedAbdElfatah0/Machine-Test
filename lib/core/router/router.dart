import 'package:calley/core/router/string_router.dart';
import 'package:calley/feature/auth/otp/presentation/screen/otp.dart';
import 'package:calley/feature/select_language/presentation/screen/select_language.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/log_in/presentation/screen/log_in_screen.dart';
import '../../feature/auth/register/presentation/screen/register.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringRouter.selectLanguage:
        return MaterialPageRoute(builder: (_) => const SelectLanguage());
      case StringRouter.signUp:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case StringRouter.signIn:
        return MaterialPageRoute(builder: (_) => const LogInScreen());
      case StringRouter.otpWhatsApp:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
          settings: settings,
        );
      //problem in router
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
