import 'package:floor/floor.dart';

@entity
class MeasureType {
  @primaryKey
  final int id;
  final String uuid;
  final String title;
  final int createdAt;
  final int changedAt;

  MeasureType(this.id, this.uuid, this.title, this.createdAt, this.changedAt);
}
