import 'package:floor/floor.dart';
import 'package:flutter_field_app/model/measure_type.dart';

@dao
abstract class MeasureTypeDao {
  @Query('SELECT * FROM measure_type')
  Future<List<MeasureType>> findAllPersons();

  @Query('SELECT * FROM measure_type WHERE _id = :id')
  Stream<MeasureType> findPersonById(int id);
}
