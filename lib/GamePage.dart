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
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/Player.dart';
import 'package:tic_tac_toe/config.dart';

//Variablen
var _player1 = new Player("O", 1,Color(0xFF0066FF),Color(0xFFFF3200));
var _player2 = new Player("X", 2,Color(0xFF0066FF),Color(0xFFFF3200));
var currentPlayer = _player1;
var otherPlayer = _player2;

class Game extends StatefulWidget {
  final Function(String) callback;

  Game(this.callback);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          centerTitle: true,
          leading: Container(),
          actions: [
            IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                nextClear = false;
                info = "";
                laps = 1;
                widget.callback(info);
                _player1 = null;
                _player2 = null;
                _player1 = new Player("O", 1,Color(0xFF0066FF),Color(0xFFFF3200));
                _player2 = new Player("X", 2,Color(0xFF0066FF),Color(0xFFFF3200));
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
            "Tic Tac Toe",
            style: Theme.of(context).textTheme.headline6,
          ),
          ),
      body: _gameBody(),
    );
  }

  //Body of the game Page
  _gameBody() {
    return Container(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Row(
                //Anzeige wer welcher Spieler ist
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 15, 3, 3),
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          "Kreis:",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Container(
                        child: Text(
                          "${_player1.lapsWon}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )
                    ],
                  ),
                  //Anzeige f??r Spieler 2
                  Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 6,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(3, 15, 3, 3),
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          "Kreuz:",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Container(
                        child: Text(
                          "${_player2.lapsWon}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )
                    ],
                  ),
                ],
              )),
          _gameBoard(),
          //Ausgabe der INFO variabel
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 59, 0, 0),
                  child: Text(
                    "Runde: $laps",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Container(
                  child: Text(
                    "Ben??tigte Siege um zu gewinnen: $lapsForWin",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 6,
          ),
        ],
      ),
    );
  }

  //Grid, in der X oder O
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
                    BoxDecoration(border: Border.all(color: Theme.of(context).accentColor)),
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

  //Was passiert wenn der Spieler dr??ckt?
  void _onTap(int index) {
    //Feld clear wenn ben??tigt
    if (nextClear) {
      _clearField();
      nextClear = false;
      return;
    }
    info = "";
    //test ob der Spieler die Methode durchgef??hrt hat
    if (!currentPlayer.onTap(index)) {
      //Wenn nein:
      return;
    }
    //Wenn ja, Test ob der aktuelle Spieler gewonnen hat
    if (currentPlayer.win()) {
      info =
          "Symbol ${currentPlayer.playerSym} hat die Runde gewonnen! Um weiter"
              " zu Spielen, "
          "einfach auf das Spielfeld klicken!";
      currentPlayer.lapsWon += 1;
      laps++;
      nextClear = true;
      // Test ob der andere Spieler gewonnen hat
    } else if (otherPlayer.win()) {
      info =
          "Symbol ${currentPlayer.playerSym} hat die Runde gewonnen! Um weiter"
              " zu Spielen, "
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
      laps = 1;
      _clearField();
      Navigator.pop(context);
      nextClear = false;
      info = "Symbol ${currentPlayer.playerSym} hat das letzte Spiel gewonnen!";
      widget.callback(info);
      return;
    } else if (otherPlayer.winGame()) {
      currentPlayer.lapsWon = 0;
      otherPlayer.lapsWon = 0;
      laps = 1;
      _clearField();
      Navigator.pop(context);
      nextClear = false;
      info = "Symbol ${currentPlayer.playerSym} hat das letzte Spiel gewonnen!";
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

//Zur??cksetzen des Spielfeldes
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
