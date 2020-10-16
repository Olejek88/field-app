import 'package:flutter/material.dart';
import 'package:flutter_field_app/database.dart';
import 'model/measure_type.dart';


class AppSelectChannelWidget extends StatefulWidget {
  final AppDatabase myDb;

  AppSelectChannelWidget({
    Key key,
    @required this.myDb,
  }) : super(key: key);

  //AppSelectChannelWidget({Key key}) : super(key: key);

  @override
  _AppSelectChannelWidgetState createState() =>
      new _AppSelectChannelWidgetState();
}

class _AppSelectChannelWidgetState extends State<AppSelectChannelWidget> {

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentMeasureType;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    //_currentMeasureType = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    widget.myDb.measureTypeDao.findAllMeasureTypes()
        .then((List<MeasureType> measureTypes) {
      for (MeasureType measureType in measureTypes) {
        items.add(new DropdownMenuItem(
            value: measureType.uuid,
            child: new Text(measureType.title)
        ));
      }
      return items;
    }).catchError((e) {});
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
              new Text("Тип измеряемой величины "),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new DropdownButton(
                //value: _currentMeasureType,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
            ],
          )
      ),
    );
  }

  void changedDropDownItem(String selectedMeasureType) {
    setState(() {
      _currentMeasureType = selectedMeasureType;
    });
  }
}