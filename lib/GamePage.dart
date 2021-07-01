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

    Contact: marks.florian123@gmail.com
 */

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/Player.dart';

//Variabeln
var _player1 = new Player("O", 1);
var _player2 = new Player("X", 2);
var currentPlayer = _player1;
var otherPlayer = _player2;
var xOrO = ["", "", "", "", "", "", "", "", ""];
var nextClear = false;
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
var info;

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: Container(),
          actions: [
            IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            )
          ],
          title: Text(
            "Tic Tac Toe von Flo",
            style: GoogleFonts.concertOne(),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xFF488DFF),
                    Color(0xFFFF0AE6),
                  ]),
            ),
          )),
      body: _gameBody(),
    );
  }

  _gameBody() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 7,
        ),
        _gameBoard(),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 7,
        ),
      ],
    );
  }

  _gameBoard() {
    return Expanded(
        child: GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            physics: new NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0x992A2A2A))),
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        _onTap(index);
                      });
                    },
                    child: Center(
                      child: Text(
                        "${xOrO[index]}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                          color: xOrOC[index],
                          fontSize: 50,
                        )),
                      ),
                    )),
              );
            }));
  }

  void _onTap(int index) {
    if (nextClear){
      _clearField();
      nextClear = false;
      return;
    }
    info = "";
    if (!currentPlayer.onTap(index)) {
      return;
    }
    if (currentPlayer.win()) {
      info = "Spieler ${currentPlayer.iD},hat gewonnen!";
      nextClear = true;
      return;
    } else if (otherPlayer.win()) {
      info = "Spieler ${otherPlayer.iD},hat gewonnen!";
      nextClear = true;
      return;
    } else if (_fieldFull()) {
      info = "Unentschieden";
      nextClear = true;
      return;
    }
    _playerChange();
  }
}

void _playerChange() {
  var pTemp = currentPlayer;
  currentPlayer = otherPlayer;
  otherPlayer = pTemp;
}

void _clearField() {
  xOrO = ["", "", "", "", "", "", "", "", ""];
  xOrOC = [
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
  currentPlayer = _player1;
  otherPlayer = _player2;

}

bool _fieldFull() {
  for (var i in xOrO) {
    if (i == "") {
      return false;
    }
  }
  return true;
}
