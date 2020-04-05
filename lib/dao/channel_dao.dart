import 'package:floor/floor.dart';
import 'package:flutter_field_app/model/channel.dart';
import 'package:uuid/uuid.dart';

@dao
abstract class ChannelDao {
  @Query('SELECT * FROM channel')
  Future<List<Channel>> findAllChannels();

  @Query('SELECT * FROM channel WHERE id = :id')
  Stream<Channel> findChannelById(int id);

  @insert
  Future<void> insertChannel(Channel channel);

  Future<void> insertChannelTitle(String title) {
    var uuid = new Uuid();
    int createdAt = new DateTime.now().millisecondsSinceEpoch;
    int changedAt = new DateTime.now().millisecondsSinceEpoch;
    Channel channel = new Channel(0, uuid.v4(), title, createdAt, changedAt);
    insertChannel(channel);
    return null;
  }
}
