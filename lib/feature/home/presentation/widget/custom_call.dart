
import 'package:flutter/material.dart';

import '../../../../core/contents/images/images.dart';
import '../../../../core/style/color_manager.dart';
import '../../../../core/style/font_style_app.dart';

class CustomCall extends StatelessWidget {
  const CustomCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Visit https://app.getcalley.com to upload numbers that you wish to call using Calley Mobile App.",
            textAlign: TextAlign.center,
            style: FontStyleApp.mediumStyle.copyWith(
              color: ColorManager.border,
            ),
          ),
        ),
        SizedBox(height: 12),
        Align(alignment: Alignment.centerLeft, child: Image.asset(Images.call)),
      ],
    );
  }
}
