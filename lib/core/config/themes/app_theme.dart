import 'package:fitness_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      cardColor: AppColors.grey,
      textTheme: GoogleFonts.montserratTextTheme().copyWith(
        bodyMedium: const TextStyle(color: AppColors.textColor),
      ),
      iconTheme: const IconThemeData(color: AppColors.iconColor),
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: AppColors.colorScheme,
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.buttonColor,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.black,
          textStyle: GoogleFonts.montserrat(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp),
        ),
      ),
    );
  }
}
