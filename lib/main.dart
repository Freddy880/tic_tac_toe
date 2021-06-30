import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GamePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
                  "Willkommen zu tic tac toe",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.concertOne(
                    fontSize: 20,
                  ),
                ),
              ),
              OutlineButton(
                  child: Text("Spiel starten"),
                color: Color(0x9FFF6969),
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Game()));
                },

              )
            ],
          )),
    );
  }
}
