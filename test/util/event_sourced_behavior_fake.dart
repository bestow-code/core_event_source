import 'package:core_event_source/event_sourced_behavior.dart';
import 'package:mocktail/mocktail.dart';

class EventSourcedBehaviorFake<Command, Event, State, View> extends Fake
    implements EventSourcedBehavior<Command, Event, State, View> {
  @override
  final CommandHandler<Command, Event, State> commandHandler;
  @override
  final StateEventHandler<Event, State> eventHandler;

  EventSourcedBehaviorFake({
    required this.commandHandler,
    required this.eventHandler,
  });
}
