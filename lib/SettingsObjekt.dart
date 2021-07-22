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
import 'package:flutter/widgets.dart';

class SettingsObjekt extends StatelessWidget {
  const SettingsObjekt(
      {Key key,
      @required this.color,
      this.icon,
      @required this.text,
      @required this.onTap,
      this.height = 40})
      : super(key: key);

  final Color color;
  final Icon icon;
  final Text text;
  final Function onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: height,
        child: Material(
          color: color,
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  width: 15,
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: icon,
                ),
                Container(
                  child: text,
                  padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                )
              ],
            ),
          ),
        ));
  }
}
