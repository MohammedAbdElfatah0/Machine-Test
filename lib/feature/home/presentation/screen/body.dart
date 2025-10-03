import 'package:calley/core/style/color_manager.dart';
import 'package:calley/core/style/font_style_app.dart';
import 'package:flutter/material.dart';

import '../../../../core/contents/images/images.dart';
import '../widget/custom_button_home_call.dart';
import '../widget/custom_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              spacing: 20,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(Images.profile),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello name',
                      style: FontStyleApp.mediumStyle.copyWith(
                        color: ColorManager.background,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Welcome to Callery!',
                      style: FontStyleApp.mediumLargeStyle.copyWith(
                        color: ColorManager.background,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          CustomCard(),
          SizedBox(height: 20),
          Expanded(child: CustomButtonHomeCall()),
        ],
      ),
    );
  }
}
