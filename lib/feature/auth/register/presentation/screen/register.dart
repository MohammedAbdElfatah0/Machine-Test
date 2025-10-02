import 'package:flutter/material.dart';

import '../../../../../core/ui/custom_logo.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              CustomLogo(),
              const SizedBox(height: 24),
              

              //form

              //button
            ],
          ),
        ),
      ),
    );
  }
}
