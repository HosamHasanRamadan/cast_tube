import 'dart:async';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cast_tube/extensions/extensions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class SleepTimerManager {
  SleepTimerManager._();

  static void Function()? onTimerFinished;
  static final singleton = SleepTimerManager._();

  static const _channelKey = 'sleep_timer_key';
  static const _channelGroupKey = 'sleep_timer_group_key';
  static const _timerId = 2021;

  final _notifications = AwesomeNotifications();

  late final _displayedStream = _notifications.displayedStream.asBroadcastStream();
  StreamSubscription? _timerSubscription;

  Future<void> init() async {
    final isReady = await _notifications.initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: _channelGroupKey,
          channelKey: _channelKey,
          channelName: 'Sleep Timer',
          channelDescription: 'Sleep timer to stop running audio',
          defaultColor: const Color.fromARGB(255, 172, 45, 45),
          ledColor: const Color.fromARGB(0, 255, 255, 255),
          playSound: false,
          importance: NotificationImportance.Min,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupkey: _channelGroupKey,
          channelGroupName: 'Sleep Timer Group',
        ),
      ],
      debug: kDebugMode,
    );

    isReady.log();
  }

  Future<void> setTimer(Duration duration, [bool forceSet = false]) async {
    if (forceSet) {
      await stop();
      await _setTimer(duration);
      return;
    }
    if (await _checkIfTimerAlreadySet()) {
      'Timer already set'.log();
      return;
    }

    _setTimer(duration);
  }

  Future<void> _setTimer(Duration duration) async {
    final timerDate = DateTime.now().add(duration);
    final isReady = await _notifications.createNotification(
      content: NotificationContent(
        id: _timerId,
        channelKey: _channelKey,
        body: 'Time to sleep',
        title: 'Sleep time',
        autoDismissible: true,
        displayOnBackground: true,
        displayOnForeground: true,
      ),
      schedule: NotificationCalendar.fromDate(
        date: timerDate,
        allowWhileIdle: true,
        repeats: false,
      ),
    );
    if (isReady) {
      await _timerSubscription?.cancel();

      _timerSubscription = _displayedStream.listen((event) {
        onTimerFinished?.call();
        stop();
      });
    }
    'Timer set $timerDate'.log();
  }

  Future<bool> _checkIfTimerAlreadySet() async {
    final allNotifications = await _notifications.listScheduledNotifications();
    final timerNotification = allNotifications.firstWhereOrNull((element) => element.content?.id == _timerId);
    return timerNotification != null;
  }

  Future<Duration> remainingTime() async {
    final allNotifications = await _notifications.listScheduledNotifications();
    final timerNotification = allNotifications.firstWhereOrNull((element) => element.content?.id == _timerId);
    if (timerNotification == null) return Duration.zero..log();
    final notificationSchedule = timerNotification.schedule! as NotificationCalendar;

    final notificationTime = DateTime(
      notificationSchedule.year!,
      notificationSchedule.month!,
      notificationSchedule.day!,
      notificationSchedule.hour!,
      notificationSchedule.minute!,
      notificationSchedule.second!,
    );
    return notificationTime.difference(DateTime.now())..log();
  }

  Future<DateTime?> notificationDateTime() async {
    final allNotifications = await _notifications.listScheduledNotifications();
    final timerNotification = allNotifications.firstWhereOrNull((element) => element.content?.id == _timerId);
    if (timerNotification == null) return null;
    final notificationSchedule = timerNotification.schedule! as NotificationCalendar;

    final notificationTime = DateTime(
      notificationSchedule.year!,
      notificationSchedule.month!,
      notificationSchedule.day!,
      notificationSchedule.hour!,
      notificationSchedule.minute!,
      notificationSchedule.second!,
    );
    return notificationTime;
  }

  Future<void> stop() async {
    await _timerSubscription?.cancel();

    _timerSubscription = null;
    await _notifications.cancel(_timerId);
  }
}
