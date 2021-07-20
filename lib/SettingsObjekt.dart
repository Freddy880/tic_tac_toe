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
