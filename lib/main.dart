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
import 'package:tic_tac_toe/config.dart';
import 'GamePage.dart';
import 'ManualPage.dart';

//Variable wich contains the actual theme
var theme = ThemeMode.system;


void main() {
  runApp(MyApp());
  if(selectedTheme == 1){
    myThemes.themeController.add(ThemeMode.dark);
  }else if(selectedTheme == 2){
    myThemes.themeController.add(ThemeMode.light);
  }else{
    myThemes.themeController.add(ThemeMode.system);
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: myThemes.theme,
      builder: (context, snapshot) => MaterialApp(
        title: 'Tic Tac Toe',
        themeMode: snapshot.data,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: MyHomePage(),
      ),
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
          "Tic Tac Toe",
          style: Theme.of(context).textTheme.headline6,
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
                child: Text(
                  "Willkommen zu tic tac toe",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 2),
                width: 200,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.play_arrow),
                  label: Text(
                    "Spiel starten",
                    style: Theme.of(context).textTheme.bodyText1.merge(
                        TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                    ),
                  ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Game(
                              setText
                          )
                      )
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 2),
              width: 200,
              child: OutlinedButton.icon(
                icon: Icon(Icons.settings),
                label: Text(
                  "Einstellungen",
                  style: Theme.of(context).textTheme.bodyText1.merge(
                      TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      )
                  ),
              ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingPage(
                            themeChanger: (){},
                          )
                      )
                  );
                },
              ),
          ),
            Container(
              padding: EdgeInsets.only(top: 2),
              width: 200,
              child: OutlinedButton.icon(
                icon: Icon(Icons.description_outlined),
                label: Text(
                  "Anleitung",
                  style: Theme.of(context).textTheme.bodyText1.merge(
                      TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      )
                  ),
                ),
                onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ManualPage()
                    )
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
