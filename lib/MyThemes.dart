import 'package:flutter/material.dart';

class MyThemes{
  static final darkTheme = _buildDarkTheme();


  static final lightTheme = _buildLightTheme();
}

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: Color(0xFFA167DF),
      primaryVariant: Color(0xFF6b10c5),
      onPrimary: Colors.white,
      secondary: Color(0xFF6769DF),
      onSecondary: Colors.black,
      error: Colors.red,
    ),
    accentColor: Color(0xFF6769DF) ,
    primaryColor: Color(0xFFA167DF),
    scaffoldBackgroundColor:Color(0xFF2E2E2F),
    appBarTheme: base.appBarTheme.copyWith(
      backwardsCompatibility: false,
      backgroundColor: Color(0xFF2E2E2F),
    ),
  );
}
ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: Color(0xFFC1005A),
      primaryVariant: Color(0xFF8a0031),
      secondary: Color(0xFF00c167),
      secondaryVariant: Color(0xFF008f3a),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
    primaryColor: Color(0xFFC1005A),
    accentColor: Color(0xFF00c167),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      color: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
        )
      )
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    )
  );
}
