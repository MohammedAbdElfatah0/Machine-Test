import 'package:flutter/widgets.dart';

class FontStyleApp {
  static const TextStyle smallStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static const TextStyle mediumStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1,
  );
  
  static const TextStyle mediumLargeStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 20 / 24,
  );

  static const TextStyle semiBoldStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  static const TextStyle boldStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 32 / 24,
  );
}
