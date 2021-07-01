import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          width: double.infinity,
          height: 100,
        ),
        _gameBoard(),
        Container(),
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
            itemBuilder: (context, i) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0x992A2A2A)
                  )
                ),
                child: GestureDetector(
                  onTap: (){
                    print("Hi $i");
                  },
                  child: Center(
                    child: Text(
                      "$i",
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              );
            }
        )
    );
  }
}
