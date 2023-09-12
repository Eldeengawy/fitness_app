import 'package:fitness_app/core/config/themes/app_theme.dart';
import 'package:fitness_app/core/functions/unfoucus.dart';
import 'package:fitness_app/modules/authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(),
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, __) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fitness App',
              theme: AppTheme.getTheme(),
              home: const LoginScreen(),
            );
          }),
    );
  }
}
