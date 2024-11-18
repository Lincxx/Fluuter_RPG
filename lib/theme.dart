import 'package:flutter/material.dart';

//app palette
class AppColors {
  static const Color primaryColor = Color.fromRGBO(162, 29, 19, 1);
  static const Color primaryAccent = Color.fromRGBO(120, 14, 14, 1);
  static const Color secondaryColor = Color.fromRGBO(45, 45, 45, 1);
  static const Color secondaryAccent = Color.fromRGBO(35, 35, 35, 1);
  static const Color titleColor = Color.fromRGBO(200, 200, 200, 1);
  static const Color textColor = Color.fromRGBO(150, 150, 150, 1);
  static const Color successColor = Color.fromRGBO(9, 149, 110, 1);
  static const Color hightlightColor = Color.fromRGBO(212, 172, 13, 1);
}

//Theme section
ThemeData primaryTheme = ThemeData(
  //seed color
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
  ),

  //Scaffold color
  scaffoldBackgroundColor: AppColors.secondaryAccent,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),

  //text theme
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),

  // an other option for text theme copyWith
  //this says to copy all the TextTheme properties from the default theme and override the ones you want
  // textTheme: TextTheme.copyWith(
  //       bodyMedium: const TextStyle(
  //         color: AppColors.textColor,
  //         fontSize: 16,
  //         letterSpacing: 1,
  //       ),
  //       headlineMedium: const TextStyle(
  //         color: AppColors.titleColor,
  //         fontSize: 16,
  //         fontWeight: FontWeight.bold,
  //         letterSpacing: 1,
  //       ),
  //       titleMedium: const TextStyle(
  //         color: AppColors.titleColor,
  //         fontSize: 18,
  //         fontWeight: FontWeight.bold,
  //         letterSpacing: 2,
  //       ),
  //     ),
);
