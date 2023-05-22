import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:splitbuddie/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType textInputType;
  const CustomTextField(
      {super.key, required this.controller, required this.hintText, this.maxLines = 1, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      style: TextStyle(color: Colors.white),
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainAppFaintColor),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Enter your $hintText";
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
