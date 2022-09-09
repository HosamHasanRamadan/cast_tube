import 'package:duration/duration.dart';
import 'package:isar/isar.dart';

class UriConverter extends TypeConverter<Uri, String> {
  const UriConverter();
  @override
  Uri fromIsar(String object) => Uri.parse(object);

  @override
  String toIsar(Uri object) => object.toString();
}

class DurationConverter extends TypeConverter<Duration?, String?> {
  const DurationConverter();

  @override
  Duration? fromIsar(String? object) {
    return object == null ? null : tryParseDuration(object);
  }

  @override
  String? toIsar(Duration? object) {
    return object?.toString();
  }
}
