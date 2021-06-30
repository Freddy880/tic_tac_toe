import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Game extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: Container(),
            actions: [
              IconButton(
                icon: Icon(Icons.power_settings_new),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: (){},
              )
            ],
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
                    ]
                ),
              ),
            )
        ),
    );
  }
}