import 'package:fitness_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    required this.validate,
    required this.hint,
    this.prefix,
    this.isPassword,
    this.isClickable,
    this.suffix,
    this.suffixPressed,
    this.autoFill,
    this.width,
    this.height,
    this.iconSize,
    this.disabled,
    this.expanded,
    this.lines,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType type;
  final void Function(String?)? onSubmit;
  final VoidCallback? onTap;
  final void Function(String?)? onChange;
  final String? Function(String?)? validate;
  final VoidCallback? suffixPressed;
  final String hint;
  final IconData? prefix;
  final bool? isPassword;
  final Iterable<String>? autoFill;
  final IconData? suffix;
  final bool? isClickable;
  final bool? disabled;
  final bool? expanded;
  final int? lines;
  final double? width;
  final double? height;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: (isPassword == true) ? 1 : null,
      expands: expanded ?? false,
      readOnly: disabled ?? false,
      style: TextStyle(
          color: Colors.white.withOpacity(.7),
          fontSize: MediaQuery.of(context).size.height / 60),
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword ?? false,
      enabled: isClickable,
      onChanged: onChange,
      validator: validate,
      autofillHints: autoFill,
      onTap: onTap,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1,
            // ),
          ),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.20),
        hintText: hint,
        hintStyle:
            TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
              color: AppColors.primaryColor.withOpacity(0.60), width: 2),
          // borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: AppColors.primaryColor.withOpacity(0.25),
            width: 1,
          ),
        ),
        // ),
        prefixIcon: Icon(
          prefix,
          color: Colors.white,
          size: iconSize,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                  color: AppColors.primaryColor,
                  size: iconSize,
                ),
                onPressed: suffixPressed,
              )
            : null,
      ),
      // ),
    );
  }
}
