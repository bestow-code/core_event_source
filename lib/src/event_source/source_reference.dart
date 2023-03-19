import '../../event_source.dart';

abstract class SourceReference<Event> {
  String get path;

  JsonEventConverter<Event> get eventJsonConverter;

  HeadReference<Event> head(
    String refId,
  );
}
