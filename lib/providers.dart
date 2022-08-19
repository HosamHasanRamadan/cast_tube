import 'dart:async';
import 'dart:collection';

import 'package:cast_tube/models/youtube_video_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

final audioPlayerProvider = Provider((ref) {
  final audioPlayer = AudioPlayer();
  ref.onDispose(() {
    audioPlayer.dispose();
  });
  return audioPlayer;
});

final loadedTracksBox = Provider<Box<Map>>((ref) => throw UnimplementedError());

final playingState = StreamProvider((ref) {
  ref.listenSelf((previous, next) {
    print(next);
  });
  return ref.watch(audioPlayerProvider.select((value) => value.processingStateStream));
});

final playbackState = StreamProvider((ref) {
  ref.listenSelf((previous, next) {
    print(next);
  });
  return ref.watch(audioPlayerProvider.select((value) => value.playbackEventStream));
});

final _boxChanges = StreamProvider((ref) {
  return ref.watch(loadedTracksBox).watch();
});
final tracksListProvider = Provider<UnmodifiableListView<YoutubeVideoDetails>>((ref) {
  ref.watch(_boxChanges);
  final newValues = ref.watch(loadedTracksBox).values;

  return UnmodifiableListView(newValues.map((e) => YoutubeVideoDetails.fromJson(e.cast<String, dynamic>())));
});

final currentTrackTimePosition = StreamProvider((ref) {
  return ref.watch(audioPlayerProvider.select((value) => value.positionStream));
});

final selectedTrackProvider = StateProvider<YoutubeVideoDetails?>((ref) => null);

final youtubeProvider = Provider((ref) => YoutubeExplode());
