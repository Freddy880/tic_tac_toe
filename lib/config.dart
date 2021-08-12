library config.globals;
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/MyThemes.dart';
int lapsForWin = 3;
var xOrO = ["", "", "", "", "", "", "", "", ""];
var nextClear = false;
var laps = 1;
List<Color> xOrOC = [
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white
];
var info = "";
var selectedTheme = 3;
final myThemes = MyThemes();

MyThemes themeManager = MyThemes();