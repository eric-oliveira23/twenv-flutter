import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData myTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.purple5100,
    secondary: AppColors.secondaryColor,
  ),
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
  ),
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
