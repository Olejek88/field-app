import 'package:floor/floor.dart';

@entity
class Channel {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String uuid;
  final String title;
  final int createdAt;
  final int changedAt;

  Channel(this.id, this.uuid, this.title, this.createdAt, this.changedAt);
}
