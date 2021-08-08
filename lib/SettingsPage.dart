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
          TextEditingController lapsWinController =
              TextEditingController(text: "$lapsForWin");
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
                      if (!formKey.currentState.validate()) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Ungültige Eingabe")));
                      } else {
                        Navigator.pop(context);
                        lapsForWin = int.parse(lapsWinController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Eingabe Erfolgreich")));
                      }
                    },
                    child: Text("Bestätigen"))
              ],
              title: Text(
                "Benötigte runden um zu gewinnen",
                style: GoogleFonts.inter(),
              ),
              content: Form(
                  key: formKey,
                  child: Container(
                    child: TextFormField(
                      controller: lapsWinController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Muss gefüllt sein";
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 2,
                      decoration: InputDecoration(
                          helperText: "Nur ganze Zahlen!",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide())),
                    ),
                  )),
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
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Einstellungen",
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Text("Generell",
                      textAlign: TextAlign.left,
                      ),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Color(0xFF656565),
                        width: 2,
                      ))),
                ),
                SettingsObjekt(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    icon: Icon(
                      Icons.wb_sunny_sharp,
                      color: Theme.of(context).iconTheme.color
                    ),
                    text: Text(
                      "Darstellung",
                    ),
                    onTap: () {
                      createDialog(context);
                    }),
                SettingsObjekt(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  icon: Icon(
                    Icons.emoji_events_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  text: Text(
                    "Gewonnen nach XY Runden",
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
                  child: Text("Informationen"),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border(
                          bottom: BorderSide(
                        color: Color(0xFF656565),
                        width: 2,
                      ))),
                ),
                SettingsObjekt(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    icon: Icon(
                      Icons.info_outline,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    text: Text(
                      "App Versions und Lizenz Infos",
                    ),
                    onTap: () {
                      setState(() {
                        showAboutDialog(
                            context: context, applicationVersion: "V.1.0.pre");
                      });
                    }),
                SettingsObjekt(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    text: Text(
                      "Open Source -> Quellcode",
                    ),
                    icon: Icon(
                      Icons.source_outlined,
                      color: Theme.of(context).iconTheme.color,
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
