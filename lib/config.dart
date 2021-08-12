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