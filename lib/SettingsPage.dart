import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/GamePage.dart';
import 'package:tic_tac_toe/SettingsObjekt.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = "https://github.com/Freddy880/tic_tac_toe";

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  createWinDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          final formKey = GlobalKey<FormState>();
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Abbrechen"),
                ),
                TextButton(
                    onPressed: () {
                      if (!formKey.currentState.validate()){
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(content: Text("Ungültige Eingabe"))
                        );
                      }else{
                        Navigator.pop(context);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                          SnackBar(content: Text("Eingabe Erfolgreich"))
                      );
                      }
                    },
                    child: Text(
                      "Bestätigen"
                    ))
              ],
              title: Text(
                "Benötigte runden um zu gewinnen",
                style: GoogleFonts.inter(),
              ),
              content: Form(
                key: formKey,
                child: Container(
                  child: TextFormField(
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Muss gefüllt sein";
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                    maxLength: 2,
                    decoration: InputDecoration(
                      helperText: "Aktuelle Auswahl: $lapsForWin",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                        )
                      )
                    ),
                  ),
                )
              ),
            );
          });
        });
  }

  createDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          var selected = 1;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(
                "Darstellung:",
                style: GoogleFonts.inter(),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: selected,
                            onChanged: (value) {
                              setState(() {
                                selected = value;
                              });
                            }),
                        Text("Dark Theme")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: selected,
                            onChanged: (value) {
                              setState(() {
                                selected = value;
                              });
                            }),
                        Text("Light Theme")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: 3,
                            groupValue: selected,
                            onChanged: (value) {
                              setState(() {
                                selected = value;
                              });
                            }),
                        Text("Fancy Theme")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: 4,
                            groupValue: selected,
                            onChanged: (value) {
                              setState(() {
                                selected = value;
                              });
                            }),
                        Text("Sys Theme")
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Bestätigen"))
              ],
            );
          });
        });
  }

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
      backgroundColor: Color(0xFF2D2D2D),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Text("Generell",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          textStyle: TextStyle(
                            color: Color(0xFFACACAC),
                          ))),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                      color: Color(0xFF2D2D2D),
                      border: Border(
                          bottom: BorderSide(
                        color: Color(0xFF656565),
                        width: 2,
                      ))),
                ),
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
                          )),
                    ),
                    onTap: () {
                      createDialog(context);
                    }),
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
                        )),
                  ),
                  onTap: () {
                    createWinDialog(context);
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text("Informationen",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          textStyle: TextStyle(
                            color: Color(0xFFACACAC),
                          ))),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                      color: Color(0xFF2D2D2D),
                      border: Border(
                          bottom: BorderSide(
                        color: Color(0xFF656565),
                        width: 2,
                      ))),
                ),
                SettingsObjekt(
                    color: Color(0xFF2D2D2D),
                    icon: Icon(
                      Icons.info_outline,
                      color: Color(0xFFDCDCDC),
                    ),
                    text: Text(
                      "App Versions und Lizenz Infos",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          textStyle: TextStyle(
                            color: Color(0xFFDCDCDC),
                          )),
                    ),
                    onTap: () {
                      setState(() {
                        showAboutDialog(
                            context: context, applicationVersion: "V.1.0.pre");
                      });
                    }),
                SettingsObjekt(
                    color: Color(0xFF2D2D2D),
                    text: Text(
                      "Open Source -> Quellcode",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          textStyle: TextStyle(
                            color: Color(0xFFDCDCDC),
                          )),
                    ),
                    icon: Icon(
                      Icons.source_outlined,
                      color: Color(0xFFDCDCDC),
                    ),
                    onTap: () {
                      _launchURL(_url);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
