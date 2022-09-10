import 'dart:io';

abstract class Env {
  static const botToken = String.fromEnvironment('bot_token');
  static const channelId = String.fromEnvironment('channel_id');
}
