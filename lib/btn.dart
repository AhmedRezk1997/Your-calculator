import 'package:flutter/material.dart';

class Btnpress extends StatelessWidget {
  final String text;
  final fillColor;
  final textColor;
  final double textSize;
  final Function callback;

  const Btnpress(
      {required this.text,
      this.fillColor,
      this.textColor = Colors.white,
      this.textSize = 28,
      required this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 65,
        width: 65,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: textSize),
          ),
          color: fillColor != null ? fillColor : null,
          textColor: textColor,
        ),
      ),
    );
  }
}
