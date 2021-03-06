/*
    Copyright (C) 2021  Florian Marks

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

    Contact: freddy880.inbox@gmail.com
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {

  final themeController = StreamController<ThemeMode>();
  get changeTheme => themeController.sink.add;
  get theme => themeController.stream;

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
      accentColor: Color(0xFF6769DF),
      primaryColor: Color(0xFFA167DF),
      scaffoldBackgroundColor: Color(0xFF2E2E2F),
      appBarTheme: base.appBarTheme.copyWith(
        backwardsCompatibility: false,
        backgroundColor: Color(0xFF2E2E2F),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.robotoCondensed(
            fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
        headline2: GoogleFonts.robotoCondensed(
            fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        headline3: GoogleFonts.robotoCondensed(
            fontSize: 48, fontWeight: FontWeight.w400),
        headline4: GoogleFonts.robotoCondensed(
            fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        headline5: GoogleFonts.robotoCondensed(
            fontSize: 24, fontWeight: FontWeight.w400),
        headline6: GoogleFonts.robotoCondensed(
            fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        subtitle1: GoogleFonts.robotoCondensed(
            fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
        subtitle2: GoogleFonts.robotoCondensed(
            fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        bodyText1: GoogleFonts.lato(
            fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
        bodyText2: GoogleFonts.lato(
            fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        button: GoogleFonts.lato(
            fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
        caption: GoogleFonts.lato(
            fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
        overline: GoogleFonts.lato(
            fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
      ));
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
        onSurface: Colors.black,
        onBackground: Colors.black,

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
          ))),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      textTheme: TextTheme(
          headline1: GoogleFonts.robotoCondensed(
              fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: GoogleFonts.robotoCondensed(
              fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3: GoogleFonts.robotoCondensed(
              fontSize: 48, fontWeight: FontWeight.w400),
          headline4: GoogleFonts.robotoCondensed(
              fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5: GoogleFonts.robotoCondensed(
              fontSize: 24, fontWeight: FontWeight.w400),
          headline6: GoogleFonts.robotoCondensed(
              fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: GoogleFonts.robotoCondensed(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: GoogleFonts.robotoCondensed(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: GoogleFonts.lato(
              fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyText2: GoogleFonts.lato(
              fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: GoogleFonts.lato(
              fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: GoogleFonts.lato(
              fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: GoogleFonts.lato(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5)
      ).apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      )
  );
}
