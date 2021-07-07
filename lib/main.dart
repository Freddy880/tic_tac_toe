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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GamePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text = "";

  setText(String text){
    setState(() {
      this.text = text;
    });
  }

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
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [Color(0xB2CE1B81), Color(0xB2361BCE)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                child: Text(
                  "$text",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.concertOne(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: double.infinity,
                child: Text(
                  "Willkommen zu tic tac toe",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.concertOne(
                    fontSize: 20,
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: 2,
                    color: Color(0xFF313131)
                  )
                ),
                  child: Text(
                    "Spiel starten",
                    style: GoogleFonts.concertOne(
                      fontSize: 20,
                      textStyle: TextStyle(
                        color: Color(0xFFE8E3E3),
                      )
                    ),
                  ),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Game(setText)));
                },

              )
            ],
          )),
    );
  }
}
