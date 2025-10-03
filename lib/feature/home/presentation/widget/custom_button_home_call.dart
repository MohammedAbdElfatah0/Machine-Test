import 'package:flutter/material.dart';

import '../../../../core/contents/images/images.dart';
import '../../../../core/style/color_manager.dart';
import 'custom_button_home.dart';

class CustomButtonHomeCall extends StatelessWidget {
  const CustomButtonHomeCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: BorderSide(color: ColorManager.success),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Images.whatsApp,
              height: 55,
              width: 55,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12),
        CustomButtonHome(onPressed: () {}, text: 'Star Calling Now'),
      ],
    );
  }
}
