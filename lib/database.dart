import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/channel_dao.dart';
import 'dao/measure_dao.dart';
import 'dao/measure_type_dao.dart';
import 'model/channel.dart';
import 'model/measure.dart';
import 'model/measure_type.dart';
import 'constants.dart' as Constants;

part 'database.g.dart'; // the generated code will be there

@Database(version: 2, entities: [MeasureType, Measure, Channel])
class AppDatabase extends FloorDatabase {
  AppDatabase db;

  MeasureTypeDao get measureTypeDao => null;

/*
  ChannelDao get channelDao;

  MeasureDao get measureDao;
*/

  Future<void> initialDatabase() async {
    db = await $FloorAppDatabase.databaseBuilder('app_database.db')
        .addMigrations([migration1to2])
        .build();
  }

  MeasureTypeDao getMeasureTypeDao() {
    return db.measureTypeDao;
  }
}
// create migration
final migration1to2 = Migration(1, 2, (database) async {
  await database.execute('INSERT INTO measure_type("uuid,title") VALUES("' +
      Constants.MEASURE_TYPE_NUMBER + '","Числовое значение")');
});

