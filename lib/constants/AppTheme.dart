import 'package:agrichapchap/constants/Appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryGreen,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.greenAccent),
  // scaffoldBackgroundColor: AppColors.lightGray,
  scaffoldBackgroundColor: AppColors.white,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 24.0,
      color: AppColors.darkGreen,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      color: AppColors.darkGreen,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0,
      color: AppColors.darkGreen,
    ),
    labelLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
      color: AppColors.black,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primaryGreen,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.lightGreen,
    // backgroundColor: AppColors.white,
    titleTextStyle: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: AppColors.black,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkGreen,
  colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark)
      .copyWith(secondary: AppColors.greenAccent),
  scaffoldBackgroundColor: AppColors.lightGreen,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 24.0,
      color: AppColors.lightGreen,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      color: AppColors.lightGreen,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0,
      color: AppColors.lightGreen,
    ),
    labelLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
      color: AppColors.white,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.darkGreen,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkGreen,
    titleTextStyle: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: AppColors.lightGray,
    ),
  ),
);
