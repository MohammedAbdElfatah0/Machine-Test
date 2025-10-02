import 'package:flutter/material.dart';
import 'package:calley/core/style/color_manager.dart';

import '../../../../core/style/font_style_app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.4,
              vertical: 21,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(ColorManager.primary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: FontStyleApp.smallStyle.copyWith(
            color: ColorManager.onPrimary,
          ),
        ),
      ),
    );
  }
}
