import 'package:flutter/material.dart';
import 'package:flutter_field_app/app_list.dart';

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(child: AppEnterDigit())
      ],
    );
  }
}
