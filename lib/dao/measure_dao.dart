import 'package:floor/floor.dart';
import 'package:flutter_field_app/model/measure.dart';

@dao
abstract class MeasureDao {
  @Query('SELECT * FROM measure')
  Future<List<Measure>> findAllMeasure();

  @Query('SELECT * FROM measure WHERE channel_id = :id')
  Stream<Measure> findMeasureByChannelId(int id);

  @insert
  Future<void> insertMeasure(Measure measure);
}
