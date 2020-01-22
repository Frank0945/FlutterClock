import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MathShape extends StatefulWidget {
  final Color color;
  final String number;
  MathShape({
    @required this.color,
    @required this.number,
  }) : super();
  @override
  State<StatefulWidget> createState() {
    return _MathShape(
      color: color,
      number: number,
    );
  }
}

class _MathShape extends State<MathShape> {
  final Color color;
  final String number;
  _MathShape({
    @required this.color,
    @required this.number,
  }) : super();
  @override
  Widget build(BuildContext context) {
    List fontColor = [];
    List fillFontColor = [];

    if (number == '0') {
      fillFontColor = [0, 1, 2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 15];
    } else if (number == '1') {
      fillFontColor = [1, 4, 7, 10, 13];
    } else if (number == '2') {
      fillFontColor = [0, 1, 2, 5, 8, 7, 6, 9, 12, 13, 14];
    } else if (number == '3') {
      fillFontColor = [0, 1, 2, 5, 8, 7, 6, 11, 14, 13, 12];
    } else if (number == '4') {
      fillFontColor = [0, 2, 3, 5, 6, 7, 8, 11, 14];
    } else if (number == '5') {
      fillFontColor = [0, 1, 2, 3, 6, 7, 8, 11, 12, 13, 14];
    } else if (number == '6') {
      fillFontColor = [0, 3, 6, 7, 8, 9, 11, 12, 13, 14];
    } else if (number == '7') {
      fillFontColor = [0, 1, 2, 5, 8, 11, 14];
    } else if (number == '8') {
      fillFontColor = [0, 1, 2, 3, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15];
    } else if (number == '9') {
      fillFontColor = [0, 1, 2, 3, 5, 6, 7, 8, 11, 14, 15];
    }

    for (int i = 0; i < 15; i++) {
      if (fillFontColor.indexOf(i) != -1) {
        fontColor.add(color);
      } else {
        fontColor.add(Colors.transparent);
      }
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: fontColor[0],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[1],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[2],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: fontColor[3],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[4],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[5],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: fontColor[6],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[7],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[8],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: fontColor[9],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[10],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[11],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: fontColor[12],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[13],
                ),
              ),
              Expanded(
                child: Container(
                  color: fontColor[14],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
