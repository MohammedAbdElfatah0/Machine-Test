import 'package:calley/core/style/font_style_app.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Welcome!", style: FontStyleApp.boldStyle),
        const SizedBox(height: 16),
        Text(
          "Please register to continue",
          style: FontStyleApp.smallStyle.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
