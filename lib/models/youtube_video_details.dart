import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_video_details.g.dart';
part 'youtube_video_details.freezed.dart';

@freezed
class YoutubeVideoDetails with _$YoutubeVideoDetails {
  const factory YoutubeVideoDetails({
    required Uri url,
    required Uri audioStreamUrl,
    required Uri thumbnailUrl,
    required String title,
  }) = _YoutubeVideoDetails;

  factory YoutubeVideoDetails.fromJson(Map<String, dynamic> json) => _$YoutubeVideoDetailsFromJson(json);
}
