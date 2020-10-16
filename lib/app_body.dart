import 'package:flutter/material.dart';
import 'app_select_channel.dart';
import 'database.dart';

class AppBody extends StatelessWidget {
  final AppDatabase myDb;

  AppBody({
    Key key,
    @required this.myDb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSelectChannelWidget(
        myDb: myDb
    );
  }
}
