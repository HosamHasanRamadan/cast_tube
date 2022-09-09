import 'package:cast_tube/converters/converters.dart';
import 'package:isar/isar.dart';

part 'youtube_track_details.g.dart';

@Collection()
class YoutubeTrackDetails with MetaFields {
  @Id()
  int? id;

  @Index(unique: true)
  late String trackId;

  @UriConverter()
  late Uri url;

  @UriConverter()
  late Uri audioStreamUrl;

  @UriConverter()
  late Uri thumbnailUrl;

  late String title;

  @DurationConverter()
  late Duration? duration;
}

mixin MetaFields {
  late final DateTime createdAt = DateTime.now();
  late final DateTime lastModifiedAt = DateTime.now();
}

extension YoutubeTrackDetailsX on YoutubeTrackDetails {
  YoutubeTrackDetails copyWith({
    Uri? url,
    Uri? audioStreamUrl,
    Uri? thumbnailUrl,
    String? title,
    Duration? duration,
  }) {
    return YoutubeTrackDetails()
      ..id = id
      ..audioStreamUrl = audioStreamUrl ?? this.audioStreamUrl
      ..thumbnailUrl = thumbnailUrl ?? this.thumbnailUrl
      ..title = title ?? this.title
      ..duration = duration ?? this.duration;
  }

  int? get expirationTimestamp {
    final timestamp = audioStreamUrl.queryParameters['expire'];
    return timestamp == null ? null : int.tryParse(timestamp);
  }

  bool get isExpired {
    if (expirationTimestamp == null) return true;
    final expirationDate = DateTime.fromMillisecondsSinceEpoch(expirationTimestamp! * 1000);
    final now = DateTime.now();
    return now.isAfter(expirationDate);
  }
}
