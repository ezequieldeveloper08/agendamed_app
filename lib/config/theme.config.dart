import 'package:flutter/material.dart';

class ThemeConfig {
  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      centerTitle: true,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blueAccent,
      onPrimary: Colors.white,
      secondary: Colors.blueAccent.shade700,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    useMaterial3: true,
  );
}
