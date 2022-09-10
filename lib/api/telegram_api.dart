import 'dart:io';

import 'package:cast_tube/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class TelegramApi {
  final dio = Dio();
  final token = Env.botToken;
  final channelId = Env.channelId;

  void sendError({
    StackTrace? stackTrace,
    Object? exception,
    ByteData? image,
    Map<String, dynamic>? extra,
  }) async {
    try {
      final template = errorTemplate(
        stackTrace ?? StackTrace.current,
        exception ?? 'Unknown',
        extra,
      );
      final dir = Directory.systemTemp.createTempSync();
      final temp = await File("${dir.path}/error.md").create();
      await temp.writeAsString(template);
      await Future.wait([
        sendDoc(doc: temp).then((value) => temp.delete()),
        if (image != null) sendPhoto(image: image),
      ]);
    } on Exception {}
  }

  void sendMessage({required String message}) {
    final url = 'https://api.telegram.org/bot$token/sendMessage';
    dio.post(
      url,
      queryParameters: {
        'chat_id': channelId,
        'text': message,
        'parse_mode': 'MarkdownV2',
        // 'disable_web_page_preview': '',
        // 'disable_notification': '',
        // 'reply_to_message_id': '',
        // 'reply_markup': '',
      },
    );
  }

  Future<void> sendPhoto({
    required ByteData image,
  }) async {
    final url = 'https://api.telegram.org/bot$token/sendPhoto';
    final data = FormData.fromMap(
      {
        'photo': MultipartFile.fromBytes(
          Uint8List.view(image.buffer).toList(),
          filename: 'error_image.png',
        ),
      },
    );
    dio.post(
      url,
      data: data,
      queryParameters: {
        'chat_id': channelId,
      },
    );
  }

  Future<void> sendDoc({
    required File doc,
  }) async {
    final url = 'https://api.telegram.org/bot$token/sendDocument';
    final data = FormData.fromMap(
      {
        'document': MultipartFile.fromBytes(
          doc.readAsBytesSync(),
          filename: 'error.md',
        ),
      },
    );
    await dio.post(
      url,
      data: data,
      queryParameters: {
        'chat_id': channelId,
      },
    );
  }
}

String errorTemplate(
  StackTrace stackTrace,
  Object error, [
  Map<String, dynamic>? extra,
]) {
  final buffer = StringBuffer();
  extra?.forEach((key, value) {
    buffer.writeln('$key : $value');
  });
  return '''
**Device Info**:\n
```
$buffer
```

**Error**:\n
```sh
$error
```

**StackTrace**:\n
```sh
$stackTrace
```
''';
}
