import 'package:appspector/appspector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_field_app/app_home.dart';

import 'database.dart';

//void main() => runApp(new MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runAppSpector();
  final myDb = await $FloorAppDatabase.databaseBuilder('app_database.db')
      .addMigrations([migration1to2])
      .build();
  runApp(App(myDb));
}

class App extends StatelessWidget {
  final AppDatabase myDb;

  const App(this.myDb);

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
      home: AppHome(
          myDb: myDb
      ),
    );
  }
}

void runAppSpector() {
  var config = new Config();
  config.androidApiKey =
  "android_MWM0ZDU3ZmQtODhhNC00ODlhLTg5Y2QtNTI2NDg0OTIyNTkw";
  AppSpectorPlugin.run(config);
}