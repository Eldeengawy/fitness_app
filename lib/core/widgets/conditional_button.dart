import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConditionalButton extends StatelessWidget {
  final bool condition;
  final void Function()? onPressed;
  final String buttonText;

  const ConditionalButton({
    super.key,
    required this.condition,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: condition,
      builder: (context) => ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.h),
          ),
          child: FittedBox(
            fit: BoxFit
                .scaleDown, // Scale the text down to fit the available space
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 20.sp, // Adjust the factor as needed
              ),
            ),
          )),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}
