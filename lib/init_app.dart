import 'dart:async';

import 'package:cast_tube/firebase_options.dart';
import 'package:cast_tube/models/youtube_track_details.dart';
import 'package:cast_tube/providers.dart';
import 'package:cast_tube/utils/deps_container.dart';
import 'package:cast_tube/utils/sleep_timer_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_platform/universal_platform.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SleepTimerManager.singleton.init();

  SleepTimerManager.onTimerFinished = stopAudio;

  await _initCrashlytics();
  await _initBackgroundAudio();
  final db = await _initDataBase();
  DepsContainer.init(overrides: [
    sleepTimerManagerProvider.overrideWithValue(SleepTimerManager.singleton),
    isarDbProvider.overrideWithValue(db),
  ]);
}

Future<void> _initBackgroundAudio() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidStopForegroundOnPause: false,
  );
}

Future<void> _initCrashlytics() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// use Crashlytics only in release mode
  if (kReleaseMode) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return true;
    };
  }
}

Future<Isar> _initDataBase() async {
  String? path;
  if (UniversalPlatform.isWeb == false) path = (await getApplicationSupportDirectory()).path;
  final isar = await Isar.open(
    schemas: [YoutubeTrackDetailsSchema],
    inspector: kDebugMode,
    directory: path,
  );
  return isar;
}

void stopAudio() => DepsContainer.read(audioPlayerProvider).pause();
