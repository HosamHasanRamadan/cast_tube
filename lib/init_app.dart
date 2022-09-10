import 'dart:ui';

import 'package:cast_tube/api/telegram_api.dart';
import 'package:cast_tube/main.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<bool> initApp() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    final map = (await DeviceInfoPlugin().deviceInfo).toMap();

    PlatformDispatcher.instance.onError = (exception, stackTrace) {
      TelegramApi().sendError(
        exception: exception,
        stackTrace: stackTrace,
        extra: map,
      );
      return true;
    };
    FlutterError.onError = (details) {
      final a = key.currentContext?.findRenderObject() as RenderRepaintBoundary;
      a.toImage().then((value) {
        value.toByteData(format: ImageByteFormat.png).then((image) {
          TelegramApi().sendError(
            exception: details.exception,
            stackTrace: details.stack ?? StackTrace.current,
            extra: map,
            image: image,
          );
        });
      });
    };

    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    );
    return true;
  } catch (e) {
    return false;
  }
}
