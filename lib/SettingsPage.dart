import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/SettingsObjekt.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              "Einstellungen",
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
        body: ListView(
          children: [
            SettingsObjekt(
            color: Color(0xFF2D2D2D),
              icon: Icon(
                  Icons.wb_sunny_sharp,
                color: Color(0xFFDCDCDC),
              ),
              text: Text(
                  "Darstellung",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  textStyle: TextStyle(
                    color: Color(0xFFDCDCDC),
                  )
                ),
              ),
              onTap: (){
              print("Tapped");
              },
            ),
            SettingsObjekt(
              color: Color(0xFF2D2D2D),
              icon: Icon(
                Icons.emoji_events_outlined,
                color: Color(0xFFDCDCDC),
              ),
              text: Text(
                "Gewonnen nach XY Runden",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    textStyle: TextStyle(
                      color: Color(0xFFDCDCDC),
                    )
                ),
              ),
              onTap: (){
                print("Tapped");
              },
            ),
          ],
        ),
    );
  }
}
