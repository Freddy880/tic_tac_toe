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
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFF0AE6),
                      Color(0xFF488DFF),
                    ]),
              ),
            )),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [Color(0xB2CE1B81), Color(0xB2361BCE)])),
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
        "Bei dem bekannten Spiel Tic Tac Toe, spielen 2 Spieler gegeneinander. "
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
