import 'package:core_event_source/event_source.dart';
import 'package:core_event_source/src/internal/data_store/in_memory_data_store.dart';

import '../../internal.dart';

/// The entry point for accessing an [EventStore]
abstract class EventStore {
  SourceReference<Event> source<Event>({
    required String path,
    required JsonEventConverter<Event> reader,
  });
}
