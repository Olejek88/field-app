import 'package:flutter/material.dart';
import 'package:flutter_field_app/app_home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Field App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          primaryIconTheme: IconThemeData(color: Colors.blue),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.black54, fontFamily: "Aveny")),
          textTheme: TextTheme(title: TextStyle(color: Colors.black54))),
      home: new AppHome(),
    );
  }
}
