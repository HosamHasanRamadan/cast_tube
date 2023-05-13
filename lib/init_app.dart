import 'dart:async';
import 'package:cast_tube/models/youtube_track_details.dart';
import 'package:cast_tube/providers.dart';
import 'package:cast_tube/utils/deps_container.dart';
import 'package:cast_tube/utils/sleep_timer_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_platform/universal_platform.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
    await SleepTimerManager.init();

    SleepTimerManager.onTimerFinished = stopAudio;
  }

  await _initBackgroundAudio();
  final db = await _initDataBase();
  DepsContainer.init(overrides: [
    isarDbProvider.overrideWithValue(db),
  ]);
}

Future<void> _initBackgroundAudio() async {
  if (UniversalPlatform.isDesktop || UniversalPlatform.isWeb) {
    return;
  }
  await JustAudioBackground.init(
    androidNotificationIcon: 'drawable/ic_stat_app_icon',
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidStopForegroundOnPause: false,
  );
}

Future<Isar> _initDataBase() async {
  String? path;
  if (UniversalPlatform.isWeb == false) path = (await getApplicationSupportDirectory()).path;
  final isar = await Isar.open(
    [YoutubeTrackDetailsSchema],
    inspector: kDebugMode,
    directory: path!,
  );
  return isar;
}

void stopAudio() => DepsContainer.read(audioPlayerProvider).pause();
