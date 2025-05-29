import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      listTileTheme: const ListTileThemeData(
        textColor: Colors.black87,
        iconColor: Colors.blue,
        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        subtitleTextStyle: TextStyle(
          fontSize: 14,
          color: Colors.black54,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
