import 'package:core_event_source/event_source.dart';

abstract class SourceReference<Event> {
  String get path;

  HeadReference<Event> head(
    String headRefName,
  );
}
