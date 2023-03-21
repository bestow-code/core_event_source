import 'package:core_event_source/event_source.dart';

/// The entry point for accessing an [EventStore]
abstract class EventStore {
  SourceReference<Event> source<Event>({
    required String path,
    required JsonEventConverter<Event> reader,
  });
}
