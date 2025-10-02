import 'package:flutter/material.dart';

import '../contents/images/images.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(Images.logo));
  }
}
