import 'package:flutter/material.dart';
import 'package:flutter_field_app/app_home.dart';

import 'database.dart';

//void main() => runApp(new MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final myDatabase = await $FloorAppDatabase.databaseBuilder('app_database.db')
      .addMigrations([migration1to2])
      .build();

  runApp(MaterialApp(
    title: 'Field App',
    home: App(myDatabase),
  ));
}

class App extends StatelessWidget {
  final AppDatabase myDatabase;

  App(this.myDatabase);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          primaryIconTheme: IconThemeData(color: Colors.blue),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.black54, fontFamily: "Aveny")),
          textTheme: TextTheme(title: TextStyle(color: Colors.black54))),
      home: new AppHome(this.myDatabase),
    );
  }
}
