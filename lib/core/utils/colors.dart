import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Colors.white;
  static const black = Colors.black;
  static const blackD = Color(0xff191C27);
  static const scaffoldBackgroundColor = Color(0xff090b0a);
  static const grey = Colors.grey;
  static const grey600 = Color(0xFF757575);
  static const textColor = Colors.white;
  static const iconColor = Colors.white;
  static const buttonColor = Colors.blue;
  static const errorColor = Colors.red;

  // Define the color scheme based on the above values
  static const colorScheme = ColorScheme(
    primary: primaryColor,
    secondary: Colors.blue,
    background: primaryColor,
    surface: primaryColor,
    onBackground: textColor,
    onSurface: textColor,
    onError: textColor,
    onPrimary: textColor,
    onSecondary: textColor,
    brightness: Brightness.dark,
    error: errorColor,
  );
}
