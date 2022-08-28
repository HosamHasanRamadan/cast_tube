extension DurationX on Duration {
  String get hhmmss {
    final hours = inHours;
    final minutes = inMinutes > 60 ? inMinutes % 60 : inMinutes;
    final seconds = inSeconds > 60 ? inSeconds % 60 : inSeconds;
    final hh = hours == 0 ? '' : hours.toString().padLeft(2, '0') + ':';
    final mm = minutes == 0 ? '00' : minutes.toString().padLeft(2, '0');
    final ss = seconds == 0 ? '00' : seconds.toString().padLeft(2, '0');
    return '$hh$mm:$ss';
  }
}
