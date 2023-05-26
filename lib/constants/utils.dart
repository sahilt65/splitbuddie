import 'package:flutter/material.dart';
import 'package:splitbuddie/constants/colors.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    
    SnackBar(
      
      content: Text(text),
      backgroundColor: AppColors.buttonColor,
    ),
  );
}
