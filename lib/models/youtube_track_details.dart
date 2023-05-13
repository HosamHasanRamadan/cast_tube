// ignore_for_file: unused_field

import 'package:cast_tube/extensions/extensions.dart';
import 'package:isar/isar.dart';

part 'youtube_track_details.g.dart';

@Collection()
class YoutubeTrackDetails with MetaFields {
  final Id id = Isar.autoIncrement;

  @Index(unique: true)
  @Name('trackId')
  final String trackId;

  @Name('url')
  final String url;

  @Name('audioStreamUrl')
  final String audioStreamUrl;

  @Name('thumbnailUrl')
  final String thumbnailUrl;

  @Name('title')
  final String title;

  @Name('duration')
  final int? duration;

  factory YoutubeTrackDetails({
    required DateTime createdAt,
    required String trackId,
    required String url,
    required String audioStreamUrl,
    required String thumbnailUrl,
    required String title,
    int? duration,
  }) {
    final object = YoutubeTrackDetails._(
      createdAt: createdAt,
      trackId: trackId,
      url: url,
      audioStreamUrl: audioStreamUrl,
      thumbnailUrl: thumbnailUrl,
      title: title,
      duration: duration,
    );
    validateObject(object);
    return object;
  }

  YoutubeTrackDetails._({
    required DateTime createdAt,
    required this.trackId,
    required this.url,
    required this.audioStreamUrl,
    required this.thumbnailUrl,
    required this.title,
    this.duration,
  }) {
    this.createdAt = createdAt;
  }
  static void validateObject(YoutubeTrackDetails object) {
    Uri.parse(object.audioStreamUrl);
    Uri.parse(object.thumbnailUrl);
    Uri.parse(object.url);
    if (object.duration != null) Duration(seconds: object.duration!);
  }
}

mixin MetaFields {
  late final DateTime createdAt;
}

extension YoutubeTrackDetailsX on YoutubeTrackDetails {
  YoutubeTrackDetails copyWith({
    String? url,
    String? audioStreamUrl,
    String? thumbnailUrl,
    String? title,
    int? duration,
  }) {
    return YoutubeTrackDetails(
      createdAt: createdAt,
      trackId: trackId,
      url: url ?? this.url,
      audioStreamUrl: audioStreamUrl ?? this.audioStreamUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      title: title ?? this.title,
      duration: duration ?? this.duration,
    );
  }

  int? get expirationTimestamp {
    final timestamp = audioStreamUrl.url.queryParameters['expire'];
    return timestamp == null ? null : int.tryParse(timestamp);
  }

  bool get isExpired {
    if (expirationTimestamp == null) return true;
    final expirationDate = DateTime.fromMillisecondsSinceEpoch(expirationTimestamp! * 1000);
    final now = DateTime.now();
    return now.isAfter(expirationDate);
  }
}
