import '../../event_sourced_behavior.dart';

mixin EventSourcedBehavior<Command, Event, State, View> {
  CommandHandler<Command, Event, State> get commandHandler;

  State get initialState;

  StateEventHandler<Event, State> get eventHandler;

  View get initialView;

  ViewEventHandler<Event, View> get viewHandler;
}
