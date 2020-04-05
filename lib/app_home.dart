import 'package:flutter/material.dart';
import 'package:flutter_field_app/app_body.dart';
import 'package:flutter_field_app/database.dart';

import 'app_enter_digit.dart';

class AppHome extends StatelessWidget {
  static const String _title = 'Field Value App';
  final AppDatabase myDb;

  AppHome(this.myDb);

  final topBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.laptop),
    title: Text(_title),
    actions: <Widget>[
      Padding(padding: const EdgeInsets.only(right: 12.0)),
      IconButton(
        icon: const Icon(Icons.add_alert),
        tooltip: 'Add alerts',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.build),
        tooltip: 'Settings',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.cached),
        tooltip: 'Update',
        onPressed: () {},
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,
        body: new AppBody(),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 50.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              // alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.add_circle,
                  ),
                  onPressed: _showEnterDigit,
                ),
                new IconButton(
                  icon: Icon(
                    Icons.assessment,
                  ),
                  onPressed: _showEnterDigit,
                ),
                new IconButton(
                  icon: Icon(
                    Icons.assignment,
                  ),
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(
                    Icons.share,
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ));
  }

  void _showEnterDigit() {
    AppEnterDigit();
  }
}
