// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:digital_clock/mathShape.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum _Element {
  background,
  text1,
  text2,
  text3,
  text4,
}

final _lightTheme = {
  _Element.background: Color.fromARGB(255, 7, 55, 99),
  _Element.text1: Color.fromARGB(255, 151, 199, 242),
  _Element.text2: Color.fromARGB(255, 242, 182, 182),
  _Element.text3: Color.fromARGB(255, 239, 231, 131),
  _Element.text4: Color.fromARGB(255, 156, 237, 197),
};

final _darkTheme = {
  _Element.background: Colors.black,
  _Element.text1: Color.fromARGB(255, 7, 55, 99),
  _Element.text2: Color.fromARGB(255, 7, 55, 99),
  _Element.text3: Color.fromARGB(255, 7, 55, 99),
  _Element.text4: Color.fromARGB(255, 7, 55, 99),
  _Element.text4: Color.fromARGB(255, 7, 55, 99),
};

/// A basic digital clock.
///
/// You can do better than this!
class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);

    return Container(
      key: ValueKey(hour + minute + colors[_Element.background].toString()),
      color: colors[_Element.background],
      child: Center(
        child: Row(
          children: <Widget>[
            Container(width: 20),
            Expanded(
              child: AspectRatio(
                aspectRatio: 3 / 5,
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: MathShape(
                    number: hour[0],
                    color: colors[_Element.text1],
                  ),
                ),
              ),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 3 / 5,
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: MathShape(
                    number: hour[1],
                    color: colors[_Element.text2],
                  ),
                ),
              ),
            ),
            Container(width: 20),
            Expanded(
              child: AspectRatio(
                aspectRatio: 3 / 5,
                child: Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: MathShape(
                    number: minute[0],
                    color: colors[_Element.text3],
                  ),
                ),
              ),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 3 / 5,
                child: Padding(
                  padding: EdgeInsets.only(right: 15, top: 20),
                  child: MathShape(
                    number: minute[1],
                    color: colors[_Element.text4],
                  ),
                ),
              ),
            ),
            Container(width: 5),
          ],
        ),
      ),
    );
  }
}
