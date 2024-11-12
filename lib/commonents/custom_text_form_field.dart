import 'package:clario_test/resources/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final bool? isValid;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Color? textColor;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    required this.controller,
    this.hint,
    this.isValid,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.textColor,
    this.onChanged,
    super.key,
  });

  InputDecoration _inputDecoration(bool? isValid) {
    var borderColor = AppColors.grey;
    var fillColor = AppColors.white;
    if (isValid == true) {
      borderColor = AppColors.green;
      fillColor = AppColors.white;
    } else if (isValid == false) {
      borderColor = AppColors.red;
      fillColor = AppColors.red.withOpacity(0.1);
    }
    return InputDecoration(
      hintText: hint,
      isDense: true,
      hintStyle: const TextStyle(
        fontSize: 16.0,
        color: AppColors.hint,
      ),
      labelStyle: TextStyle(
        fontSize: 16.0,
        color: borderColor,
      ),
      filled: true,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: borderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        // Add this block
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: borderColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: borderColor),
      ),
      errorStyle: TextStyle(color: borderColor),
      errorText: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    var textColor = AppColors.dartGrey;
    if (isValid == true) {
      textColor = AppColors.green;
    } else if (isValid == false) {
      textColor = AppColors.red;
    }

    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 16.0,
          color: textColor,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: _inputDecoration(isValid).copyWith(
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
