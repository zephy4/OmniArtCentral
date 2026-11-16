import 'package:flutter/material.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: ColorsManager.primaryColor,
      scaffoldBackgroundColor: ColorsManager.white,
      fontFamily: 'ProximaNova',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: 'ProximaNova'),
        displayMedium: TextStyle(fontFamily: 'ProximaNova'),
        displaySmall: TextStyle(fontFamily: 'ProximaNova'),
        headlineLarge: TextStyle(fontFamily: 'ProximaNova'),
        headlineMedium: TextStyle(fontFamily: 'ProximaNova'),
        headlineSmall: TextStyle(fontFamily: 'ProximaNova'),
        titleLarge: TextStyle(fontFamily: 'ProximaNova'),
        titleMedium: TextStyle(fontFamily: 'ProximaNova'),
        titleSmall: TextStyle(fontFamily: 'ProximaNova'),
        bodyLarge: TextStyle(fontFamily: 'ProximaNova'),
        bodyMedium: TextStyle(fontFamily: 'ProximaNova'),
        bodySmall: TextStyle(fontFamily: 'ProximaNova'),
        labelLarge: TextStyle(fontFamily: 'ProximaNova'),
        labelMedium: TextStyle(fontFamily: 'ProximaNova'),
        labelSmall: TextStyle(fontFamily: 'ProximaNova'),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
