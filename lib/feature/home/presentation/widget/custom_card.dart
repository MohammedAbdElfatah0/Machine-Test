import 'package:flutter/material.dart';
import '../../../../core/style/color_manager.dart';
import '../../../../core/style/font_style_app.dart';
import 'custom_call.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff1E3365),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "LODO NUMBER TO CALL",
              style: FontStyleApp.mediumStyle.copyWith(
                color: ColorManager.background,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 12, right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: ColorManager.background,
            ),
            alignment: Alignment.center,
            child: CustomCall(),
          ),
        ],
      ),
    );
  }
}
