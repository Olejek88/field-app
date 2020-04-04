import 'package:floor/floor.dart';
import 'package:flutter_field_app/model/channel.dart';
import 'package:flutter_field_app/model/measure_type.dart';

@Entity(
  tableName: 'measure',
  foreignKeys: [
    ForeignKey(
      childColumns: ['measure_type_id'],
      parentColumns: ['id'],
      entity: MeasureType,
    ),
    ForeignKey(
      childColumns: ['channel_id'],
      parentColumns: ['id'],
      entity: Channel,
    )
  ],
  indices: [
    Index(value: ['channel_id'])
  ],
)
class Measure {
  @primaryKey
  final int id;
  final String uuid;
  final double value;

  final int createdAt;
  final int changedAt;

  @ColumnInfo(name: 'measure_type_id')
  final int measureTypeId;

  @ColumnInfo(name: 'channel_id')
  final int channelId;

  Measure(this.id, this.uuid, this.value, this.measureTypeId, this.channelId,
      this.createdAt, this.changedAt);
}
