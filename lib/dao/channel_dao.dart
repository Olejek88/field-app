import 'package:floor/floor.dart';
import 'package:flutter_field_app/model/channel.dart';

@dao
abstract class ChannelDao {
  @Query('SELECT * FROM channel')
  Future<List<Channel>> findAllChannels();

  @Query('SELECT * FROM channel WHERE id = :id')
  Stream<Channel> findChannelById(int id);

  @insert
  Future<void> insertChannel(Channel channel);
}
