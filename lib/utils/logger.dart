// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:developer' as dev;

abstract class Logger {
  static void log({
    String? message,
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String? name,
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
    bool isRich = false,
  }) {
    final _stackTrace = isRich ? stackTrace ?? StackTrace.current : null;
    final _zone = isRich ? zone ?? Zone.current : null;

    dev.log(
      message ?? 'None',
      time: DateTime.now(),
      sequenceNumber: sequenceNumber,
      name: name ?? '',
      zone: _zone,
      error: error,
      stackTrace: _stackTrace,
    );
  }
}
