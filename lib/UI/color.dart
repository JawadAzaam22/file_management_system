import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF2196F3),
    canvasColor: const Color(0xFFF5F5F5),
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFF2196F3),
    ),
    colorScheme: const ColorScheme.light(
      primaryContainer: Color(0xFFE3F2FD),
      secondary: Color(0xFF03A9F4),
      primary: Color(0xFF2196F3),
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Color(0xFF424242),
      background: Colors.white,
      onBackground: Color(0xFF424242),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF616161)),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF212121)),
      bodyMedium: TextStyle(color: Color(0xFF424242)),
    ),
    dividerColor: Color(0xFFBDBDBD),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1A649A),

    //buttonColor

    scaffoldBackgroundColor: const Color(0xFF121212),
    buttonTheme: ButtonThemeData(buttonColor: Color(0xFF1A649A)),
    colorScheme: const ColorScheme.dark(
      primaryContainer: Color(0x3F06235B),
      secondary: Color(0x3F06235B),
      primary: Color(0xFF1A649A),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
    dividerColor: Colors.white24,
  );

  static LinearGradient backgroundGradient(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return LinearGradient(
      colors: isDarkMode
          ? [const Color(0xFF1A649A), const Color(0xFF034473)]
          : [const Color(0xFF2196F3), const Color(0xFFBBDEFB)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
