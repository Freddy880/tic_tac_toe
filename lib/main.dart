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
import 'package:tic_tac_toe/MyThemes.dart';
import 'package:tic_tac_toe/SettingsPage.dart';

import 'GamePage.dart';
import 'ManualPage.dart';

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
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
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

  setText(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Tic Tac Toe von Flo",
        ),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: double.infinity,
            child: Text("$text"),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Text("Willkommen zu tic tac toe"),
          ),
          Container(
            padding: EdgeInsets.only(top: 2),
            width: 150,
            child: ElevatedButton.icon(
              icon: Icon(Icons.play_arrow),
              label: Text(
                "Spiel starten",
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Game(setText)));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2),
            width: 150,
            child: OutlinedButton.icon(
              icon: Icon(Icons.settings),
              label: Text(
                "Einstellungen",
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2),
            width: 150,
            child: OutlinedButton.icon(
              icon: Icon(Icons.description_outlined),
              label: Text(
                "Anleitung",
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ManualPage()));
              },
            ),
          ),
        ],
      )),
    );
  }
}
