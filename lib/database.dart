import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/measure_type_dao.dart';
import 'model/measure_type.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [MeasureType])
abstract class AppDatabase extends FloorDatabase {
  MeasureTypeDao get measureTypeDao;
}
