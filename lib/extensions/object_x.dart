// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:cast_tube/utils/logger.dart';

extension ObjectX on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;

  void log({
    String? message,
    DateTime? time,
    int? sequenceNumber,
    int? level,
    String? name,
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
    bool isRich = false,
  }) {
    final _name = name ?? runtimeType.toString();
    final _stackTrace = isRich ? stackTrace ?? StackTrace.current : null;
    final _zone = isRich ? zone ?? Zone.current : null;

    Logger.log(
      message: toString(),
      time: DateTime.now(),
      sequenceNumber: sequenceNumber,
      name: _name,
      zone: _zone,
      error: error,
      stackTrace: _stackTrace,
      isRich: isRich,
    );
  }
}
