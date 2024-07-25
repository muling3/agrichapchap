import 'package:agrichapchap/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle get loginButtonStyle => ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryGreen, // Text color
        minimumSize: const Size(double.infinity, 48), // Width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Button border radius
        ),
        elevation: 5, // Box shadow
        shadowColor: Colors.black.withOpacity(0.2), // Shadow color
        padding: const EdgeInsets.symmetric(vertical: 12.0), // Vertical padding
      ).copyWith(
        side: WidgetStateProperty.all(const BorderSide(
          color: AppColors.mintGreen, // Border color (if you want a border)
          width: 1.0,
        )),
      );
}
