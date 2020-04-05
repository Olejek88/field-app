import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:flutter/material.dart';


class AppSelectChannelWidget extends StatefulWidget {
  AppSelectChannelWidget({Key key}) : super(key: key);

  @override
  _AppSelectChannelWidgetState createState() =>
      new _AppSelectChannelWidgetState();
}

class _AppSelectChannelWidgetState extends State<AppSelectChannelWidget> {

  MeasureTypeDao findAllMeasureTypes()

  List _channels =
  ;

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Please choose your city: "),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new DropdownButton(
                value: _currentCity,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
            ],
          )
      ),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }

}