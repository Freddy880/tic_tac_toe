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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ManualPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Tic Tac Toe von Flo",
            style: GoogleFonts.concertOne(),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: _buildContent(),
        ));
  }

  _buildContent() {
    return Column(children: [
      Container(
        child: Text(
          "Allgemein",
          style: GoogleFonts.lato(
              textStyle: TextStyle(
            fontSize: 35,
          )),
        ),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
          child: Text(
            "Bei dem bekannten Spiel Tic Tac Toe, spielen 2 Spieler"
                " gegeneinander. "
            "Das Ziel des Spiels ist es, dass man als Spieler drei seiner"
            "Zeichen Vertikal, Horizontal oder Diagonal platziert."
            "Die Spieler Spielen abwechselnd. In dieser version muss man"
            "mehrere Runden gewinnen, um das Gesamte Spiel zu gewinnen."
            "Die Anzahl der benötigten gewinne kann in den Einstellungen"
            " geändert werden. Nach einer Runde muss man nur auf das Spielfeld"
            "klicken, um es zurückzusetzen. Der Computer Zählt von selber",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              fontSize: 18,
            )),
          ))
    ]);
  }
}
