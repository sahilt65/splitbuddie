import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      textAlignVertical: TextAlignVertical.center,
      maxLines: 1,
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        focusColor: Colors.white,
        contentPadding: EdgeInsets.only(bottom: 15, right: 12, top: 12, left: 12),
        filled: true,
        fillColor: Color(0xFFF2F5FD),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 15.0.sp,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Enter your $hintText";
        }
        return null;
      },
    );
  }
}

