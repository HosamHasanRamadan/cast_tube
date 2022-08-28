// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'youtube_video_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

YoutubeVideoDetails _$YoutubeVideoDetailsFromJson(Map<String, dynamic> json) {
  return _YoutubeVideoDetails.fromJson(json);
}

/// @nodoc
mixin _$YoutubeVideoDetails {
  Uri get url => throw _privateConstructorUsedError;
  Uri get audioStreamUrl => throw _privateConstructorUsedError;
  Uri get thumbnailUrl => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YoutubeVideoDetailsCopyWith<YoutubeVideoDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeVideoDetailsCopyWith<$Res> {
  factory $YoutubeVideoDetailsCopyWith(
          YoutubeVideoDetails value, $Res Function(YoutubeVideoDetails) then) =
      _$YoutubeVideoDetailsCopyWithImpl<$Res>;
  $Res call(
      {Uri url,
      Uri audioStreamUrl,
      Uri thumbnailUrl,
      String title,
      Duration? duration});
}

/// @nodoc
class _$YoutubeVideoDetailsCopyWithImpl<$Res>
    implements $YoutubeVideoDetailsCopyWith<$Res> {
  _$YoutubeVideoDetailsCopyWithImpl(this._value, this._then);

  final YoutubeVideoDetails _value;
  // ignore: unused_field
  final $Res Function(YoutubeVideoDetails) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? audioStreamUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? title = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      audioStreamUrl: audioStreamUrl == freezed
          ? _value.audioStreamUrl
          : audioStreamUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
abstract class _$$_YoutubeVideoDetailsCopyWith<$Res>
    implements $YoutubeVideoDetailsCopyWith<$Res> {
  factory _$$_YoutubeVideoDetailsCopyWith(_$_YoutubeVideoDetails value,
          $Res Function(_$_YoutubeVideoDetails) then) =
      __$$_YoutubeVideoDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {Uri url,
      Uri audioStreamUrl,
      Uri thumbnailUrl,
      String title,
      Duration? duration});
}

/// @nodoc
class __$$_YoutubeVideoDetailsCopyWithImpl<$Res>
    extends _$YoutubeVideoDetailsCopyWithImpl<$Res>
    implements _$$_YoutubeVideoDetailsCopyWith<$Res> {
  __$$_YoutubeVideoDetailsCopyWithImpl(_$_YoutubeVideoDetails _value,
      $Res Function(_$_YoutubeVideoDetails) _then)
      : super(_value, (v) => _then(v as _$_YoutubeVideoDetails));

  @override
  _$_YoutubeVideoDetails get _value => super._value as _$_YoutubeVideoDetails;

  @override
  $Res call({
    Object? url = freezed,
    Object? audioStreamUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? title = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_YoutubeVideoDetails(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      audioStreamUrl: audioStreamUrl == freezed
          ? _value.audioStreamUrl
          : audioStreamUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_YoutubeVideoDetails implements _YoutubeVideoDetails {
  const _$_YoutubeVideoDetails(
      {required this.url,
      required this.audioStreamUrl,
      required this.thumbnailUrl,
      required this.title,
      this.duration});

  factory _$_YoutubeVideoDetails.fromJson(Map<String, dynamic> json) =>
      _$$_YoutubeVideoDetailsFromJson(json);

  @override
  final Uri url;
  @override
  final Uri audioStreamUrl;
  @override
  final Uri thumbnailUrl;
  @override
  final String title;
  @override
  final Duration? duration;

  @override
  String toString() {
    return 'YoutubeVideoDetails(url: $url, audioStreamUrl: $audioStreamUrl, thumbnailUrl: $thumbnailUrl, title: $title, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_YoutubeVideoDetails &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.audioStreamUrl, audioStreamUrl) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailUrl, thumbnailUrl) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(audioStreamUrl),
      const DeepCollectionEquality().hash(thumbnailUrl),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_YoutubeVideoDetailsCopyWith<_$_YoutubeVideoDetails> get copyWith =>
      __$$_YoutubeVideoDetailsCopyWithImpl<_$_YoutubeVideoDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_YoutubeVideoDetailsToJson(
      this,
    );
  }
}

abstract class _YoutubeVideoDetails implements YoutubeVideoDetails {
  const factory _YoutubeVideoDetails(
      {required final Uri url,
      required final Uri audioStreamUrl,
      required final Uri thumbnailUrl,
      required final String title,
      final Duration? duration}) = _$_YoutubeVideoDetails;

  factory _YoutubeVideoDetails.fromJson(Map<String, dynamic> json) =
      _$_YoutubeVideoDetails.fromJson;

  @override
  Uri get url;
  @override
  Uri get audioStreamUrl;
  @override
  Uri get thumbnailUrl;
  @override
  String get title;
  @override
  Duration? get duration;
  @override
  @JsonKey(ignore: true)
  _$$_YoutubeVideoDetailsCopyWith<_$_YoutubeVideoDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
