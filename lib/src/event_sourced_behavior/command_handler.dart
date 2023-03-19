import '../../event_sourced_behavior.dart';

///
typedef CommandHandler<Command, Event, State>
    = EventSourcedBehaviorEffect<Event> Function(State state, Command command);
