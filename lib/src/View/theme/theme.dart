import 'package:flutter/material.dart';

class ThemeBuilder{
  static ThemeData get userTheme{
    ColorScheme colorScheme = ColorScheme(
      primary: Color(0xFFE30F0B),
      primaryVariant: Color(0xFFE36866),
      secondary: Color(0xFFC4C71A),
      secondaryVariant: Color(0xAAEDEF81),
      onError: Color(0xFF830E0C),
      error: Color(0xFFF26B69),
      onBackground: Colors.black87,
      background: Colors.white24,
      onPrimary: Colors.blue[900],
      surface: Color(0xFFE30F0B),
      onSurface: Colors.white,
      onSecondary: Colors.black87,
      brightness: Brightness.light,

    );
    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      accentColor: colorScheme.secondaryVariant
      
    );
  }
}