import 'package:core_event_source/event_source.dart';
import 'package:core_event_source/event_sourced_behavior.dart';

abstract class HeadReference<Event> {
  SourceReference<Event> get sourceReference;

  String get headRefName;

  /// Initializes, creating initial entry and main ref if necessary
  Future<EventSource<Command, View>> get<Command, State, View>({
    required EventSourcedBehavior<Command, Event, State, View> behavior,
  });
}
