import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core_event_source/event_sourced_behavior.dart';

part 'command_processor.freezed.dart';

class CommandProcessor<Command, Event, State> {
  final CommandHandler<Command, Event, State> commandHandler;
  final StateEventHandler<Event, State> eventHandler;

  CommandProcessor({
    required this.commandHandler,
    required this.eventHandler,
  });

  EventSourcedBehaviorEffect<Event> apply(
      State state, Iterable<Command> commands) {
    try {
      final result = commands.fold<StateEvents<Event, State>>(
          StateEvents(state: state, events: []),
          (previous, command) => commandHandler(previous.state, command).map(
                none: (none) => previous,
                persist: (persist) => previous.copyWith(
                    state: persist.events
                        .fold<State>(previous.state, eventHandler),
                    events: [...previous.events, ...persist.events]),
                notSupported: (notSupported) => throw notSupported,
              ));
      return result.events.isEmpty
          ? EventSourcedBehaviorEffect.none()
          : EventSourcedBehaviorEffect.persist(result.events);
    } on EventSourcedBehaviorEffectNotSupported<Event> catch (effect) {
      return effect;
    }
  }
}

@freezed
class StateEvents<Event, State> with _$StateEvents<Event, State> {
  factory StateEvents({
    required State state,
    required Iterable<Event> events,
  }) = _StateEvents;
}
