import 'package:calley/core/style/font_style_app.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/color_manager.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isAppInfo;

  const MenuItem({super.key, 
    required this.icon,
    required this.title,
    required this.onTap,
    this.isAppInfo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isAppInfo && title == 'About Us')
          Column(
            children: [
              Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'App Info',
                    style: FontStyleApp.semiBoldStyle.copyWith(
                      color: ColorManager.primary,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
        ListTile(leading: Icon(icon), title: Text(title), onTap: onTap),
      ],
    );
  }
}
