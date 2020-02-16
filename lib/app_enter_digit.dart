import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

class AppEnterDigit extends StatelessWidget {
  final double _currentDoubleValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new NumberPickerDialog.decimal(
              minValue: 1,
              maxValue: 5,
              decimalPlaces: 2,
              initialDoubleValue: _currentDoubleValue,
              title: new Text("Pick a decimal number"),
            )
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text('Add value'),
      ),
    );
  }
}
