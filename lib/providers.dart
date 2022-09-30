import 'dart:collection';
import 'package:cast_tube/main.dart';
import 'package:cast_tube/models/youtube_track_details.dart';
import 'package:cast_tube/utils/logger.dart';
import 'package:cast_tube/utils/sleep_timer_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import 'package:just_audio/just_audio.dart';
import 'package:share_handler/share_handler.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

final isarDbProvider = Provider<Isar>((_) => throw UnimplementedError('Needs to be overridden'));

final audioPlayerProvider = Provider((ref) {
  final audioPlayer = AudioPlayer();
  ref.onDispose(() {
    audioPlayer.dispose();
  });
  return audioPlayer;
});

final playingState = StreamProvider((ref) {
  ref.listenSelf((previous, next) {
    Logger.log(message: next.toString());
  });
  return ref.watch(audioPlayerProvider.select((value) => value.processingStateStream));
});

final playbackStateProvider = StreamProvider((ref) {
  return ref.watch(audioPlayerProvider.select((value) => value.playbackEventStream));
});

final tracksListProvider = Provider<UnmodifiableListView<YoutubeTrackDetails>>((ref) {
  final db = ref.watch(isarDbProvider);
  final query = db.youtubeTrackDetailss.where().sortByCreatedAtDesc();
  final sub = query.watchLazy().listen((event) {
    ref.invalidateSelf();
  });
  ref.onDispose(() {
    sub.cancel();
  });

  return UnmodifiableListView(query.findAllSync());
});

final currentTrackTimePosition = StreamProvider((ref) {
  return ref.watch(audioPlayerProvider.select((value) => value.positionStream));
});

final selectedTrackProvider = StateProvider<YoutubeTrackDetails?>((ref) => null);

final youtubeProvider = Provider((ref) => YoutubeExplode());

final receiveIntentProvider = StreamProvider<String?>((ref) async* {
  if (UniversalPlatform.isDesktop || UniversalPlatform.isWeb) {
    yield null;
    return;
  }
  final handler = ShareHandlerPlatform.instance;
  final initialValue = await handler.getInitialSharedMedia();
  yield initialValue?.content;
  yield* handler.sharedMediaStream.map((event) => event.content);
});

final youtubePlayerProvider = Provider((ref) {
  return YouTubePlayer(ref.read);
});

final sleepTimerManagerProvider = Provider<SleepTimerManager>((ref) {
  throw UnimplementedError('Should Override its value');
});
