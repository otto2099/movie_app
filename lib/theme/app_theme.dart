import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = const Color.fromRGBO(95, 161, 209, 10);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    // AppBar theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    // AppBar theme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    //caffoldBackgroundColor: Colors.black
  );
}
