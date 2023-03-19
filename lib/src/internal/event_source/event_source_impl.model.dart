part of 'event_source_impl.dart';

@freezed
class EventSourceEvent<Command, Event> with _$EventSourceEvent<Command, Event> {
  factory EventSourceEvent.commandsApply(Iterable<Command> commands) =
      EventSourceEventCommandsApply<Command, Event>;

  factory EventSourceEvent.entryCollectionUpdate() =
      EventSourceEventEntryCollectionUpdate;

  factory EventSourceEvent.error() = EventSourceEventError<Command, Event>;
}
// State --------------------------------------------------------------------------

@freezed
class EventSourceState with _$EventSourceState {
  factory EventSourceState.initial(
      // EntryRef rootEntryRef,
      EntryRef headEntryRef) = EventSourceStateInitial;
  factory EventSourceState.ready(EntryRef entryRef) = EventSourceStateReady;

  factory EventSourceState.failure(Object error, [StackTrace? stackTrace]) =
      EventSourceStateFailure;
}
