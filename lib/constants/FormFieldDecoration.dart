import 'package:agrichapchap/constants/Appcolors.dart';
import 'package:flutter/material.dart';

InputDecoration formFieldDecoration(String labelText) => InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: AppColors.mintGreenText, fontSize: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: AppColors.mintGreen,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: AppColors.forestGreen,
          width: 1.0,
        ),
      ),
    );
