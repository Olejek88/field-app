import 'package:floor/floor.dart';
import 'package:flutter_field_app/model/measure_type.dart';

@dao
abstract class MeasureTypeDao {
  @Query('SELECT * FROM measure_type')
  Future<List<MeasureType>> findAllMeasureTypes();

  @Query('SELECT * FROM measure_type WHERE id = :id')
  Stream<MeasureType> findMeasureTypeById(int id);

  @insert
  Future<void> insertMeasureType(MeasureType measureType);
}
