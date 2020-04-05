import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

class AppEnterDigit extends StatelessWidget {
  final double _currentDoubleValue = 1.0;

  //final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //final person = await database.findPersonById(1);
  //await database.insertPerson(person);
  //MyDatabase myDatabase = MyDatabase();
  //final userDao = await myDatabase.initialDatabase();

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
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add_circle),
        onPressed: _saveValue,
      ),
    );
  }

  void _saveValue() {
    _currentDoubleValue;
  }
}
