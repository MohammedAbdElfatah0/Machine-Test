import 'package:calley/core/style/font_style_app.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: FontStyleApp.boldStyle, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Text(
          subtitle,
          style: FontStyleApp.smallStyle.copyWith(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
