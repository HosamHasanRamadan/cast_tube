// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_YoutubeVideoDetails _$$_YoutubeVideoDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_YoutubeVideoDetails(
      url: Uri.parse(json['url'] as String),
      audioStreamUrl: Uri.parse(json['audioStreamUrl'] as String),
      thumbnailUrl: Uri.parse(json['thumbnailUrl'] as String),
      title: json['title'] as String,
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$$_YoutubeVideoDetailsToJson(
        _$_YoutubeVideoDetails instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'audioStreamUrl': instance.audioStreamUrl.toString(),
      'thumbnailUrl': instance.thumbnailUrl.toString(),
      'title': instance.title,
      'duration': instance.duration?.inMicroseconds,
    };
