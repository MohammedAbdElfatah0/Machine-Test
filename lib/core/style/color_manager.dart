import 'package:flutter/material.dart';

/// Centralized color definitions for the whole app
/// Add new colors here as the design evolves.
class ColorManager {
  ColorManager._();

  // Brand
  static const Color primary = Colors.blue;
  static const Color onPrimary = Colors.white;

  // Backgrounds
  static const Color background = Colors.white;
  static const Color surface = Colors.white;

  // Text
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.grey;
  static const Color link = Colors.blue;

  // Borders
  static const Color border = Colors.black; // used in input borders
  static const Color divider = Colors.grey; // card outer border

  // States
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;

  // Inputs / Controls
  static const Color checkboxActive = Colors.black;
  static const Color checkboxCheck = Colors.white;

  // Helpers
  static const Color hint = Colors.grey;
}
