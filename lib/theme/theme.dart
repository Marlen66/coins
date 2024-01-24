import 'package:flutter/material.dart';

final themeData = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor:
      const Color.fromARGB(255, 80, 80, 80).withOpacity(0.4),
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 36, 36, 36),
      elevation: 0,
      foregroundColor: Colors.white),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  dividerColor: Colors.white24,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  ),
);
