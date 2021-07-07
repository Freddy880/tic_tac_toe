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
var laps = 0;
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

class Game extends StatefulWidget {
  Function(String) callback;

  Game(this.callback);

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
                nextClear = false;
                info = "";
                widget.callback(info);
                _player1 = null;
                _player2 = null;
                _player1 = new Player("O", 1);
                _player2 = new Player("X", 2);
                currentPlayer = _player1;
                otherPlayer = _player2;
                _clearField();
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _clearField();
                });
              },
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
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Color(0xB2CE1B81), Color(0xB2361BCE)])),
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Row(
                //Anzeige wer welcher spieler ist
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 15, 3, 3),
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          "Spieler 1:",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 25,
                          )),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 3,
                          padding: EdgeInsets.all(10),
                          child: Text("O",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                color: Color(0xFF1F1F1F),
                                fontSize: 30,
                              )))),
                    ],
                  ),
                  //Anzeige für Spieler 2
                  Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Center(
                            child: Text(
                              "Spielstand: \n "
                              "${_player1.lapsWon} : ${_player2.lapsWon}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 15, 3, 3),
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          "Spieler 2:",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 25,
                          )),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 3,
                          padding: EdgeInsets.all(10),
                          child: Text("X",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                color: Color(0xFF1F1F1F),
                                fontSize: 30,
                              )))),
                    ],
                  ),
                ],
              )),
          _gameBoard(),
          //Ausgabe der INFO variabel
          Container(
            child: Text(
              "$info",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                fontSize: 20,
              )),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 6,
          ),
        ],
      ),
    );
  }

  //Grid, inder X oder O
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
                          fontSize: 60,
                        )),
                      ),
                    )),
              );
            }));
  }

  //Was passiert wenn der spieler drückt?
  void _onTap(int index) {
    //Feld clear wenn benötigt
    if (nextClear) {
      _clearField();
      nextClear = false;
      return;
    }
    info = "";
    //test ob der Spieler die Methode durchgeführt hat
    if (!currentPlayer.onTap(index)) {
      //Wenn nein:
    }
    //Wenn ja, Test ob der aktuelle Spieler gewonnen hat
    if (currentPlayer.win()) {
      info =
          "Spieler ${currentPlayer.iD} hat die Runde gewonnen! Um weiter zu Spielen, "
          "einfach auf das Spielfeld klicken!";
      currentPlayer.lapsWon += 1;
      laps++;
      nextClear = true;
      // Test ob der andere Spieler gewonnen hat
    } else if (otherPlayer.win()) {
      info =
          "Spieler ${otherPlayer.iD} hat die Runde gewonnen! Um weiter zu Spielen, "
          "einfach auf das Spielfeld klicken!";
      otherPlayer.lapsWon += 1;
      nextClear = true;
      laps++;
      //Kontrolle ob das Feld voll ist
    } else if (_fieldFull()) {
      info = "Unentschieden! Um weiter zu Spielen, "
          "einfach auf das Spielfeld klicken!";
      nextClear = true;
      laps++;
    }
    if (currentPlayer.winGame()) {
      currentPlayer.lapsWon = 0;
      otherPlayer.lapsWon = 0;
      laps = 0;
      _clearField();
      Navigator.pop(context);
      info = "Spieler ${currentPlayer.iD} hat das letzte Spiel gewonnen!";
      widget.callback(info);
      return;
    } else if (otherPlayer.winGame()) {
      currentPlayer.lapsWon = 0;
      otherPlayer.lapsWon = 0;
      laps = 0;
      _clearField();
      Navigator.pop(context);
      info = "Spieler ${otherPlayer.iD} hat das letzte Spiel gewonnen!";
      widget.callback(info);
      return;
    }
    //Spielerwechsel
    _playerChange();
  }
}

void _playerChange() {
  var pTemp = currentPlayer;
  currentPlayer = otherPlayer;
  otherPlayer = pTemp;
}

//Zurücksetzen des Spielfeldes
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
