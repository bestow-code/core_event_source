import 'dart:async';

import 'package:bloc/bloc.dart' hide EventHandler;
import 'package:core_event_source/internal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entry.dart';

class EventSourceInternal<Command, Event, State>
    extends Bloc<EventSourceEvent<Command, Event>, EventSourceState> {
  final CommandProcessor<Command, Event, State> _commandProcessor;
  final EntryCollection<Event> _entryCollection;
  final Value<Event, State> _stateValue;
  final EntryFactory<Event> _entryFactory;
  final HeadEffectDispatcher<Event> _dispatcher;

  late final StreamSubscription subscription;

  EventSourceInternal(
    super.initialState, {
    required HeadEffectDispatcher<Event> dispatcher,
    required CommandProcessor<Command, Event, State> commandProcessor,
    required Value<Event, State> stateValue,
    required EntryCollection<Event> entryCollection,
    required Stream onUpdate,
    EntryFactory<Event>? entryFactory,
  })  : _dispatcher = dispatcher,
        _commandProcessor = commandProcessor,
        _stateValue = stateValue,
        _entryCollection = entryCollection,
        _entryFactory = entryFactory ?? EntryFactory.randomRefCreatedNow() {
    on<EventSourceEventCommandsApply<Command, Event>>(
      (event, emit) async => state.maybeMap(
        orElse: () => addError(event),
        ready: (ready) async => await _handleHeadEffect(
            _commandProcessor.apply(_stateValue.current, event.commands).map(
                persist: (persist) => HeadEffect.append(
                    ready.entryRef,
                    _entryFactory.create(
                        refs: [ready.entryRef], events: persist.events)),
                none: (none) => HeadEffect.none(),
                notSupported: (notSupported) {
                  addError(notSupported);
                  return HeadEffect.none();
                }),
            emit),
      ),
    );
    on<EventSourceEventEntryCollectionUpdate<Command, Event>>(
        (event, emit) async => state.maybeMap(
            orElse: () => addError(event),
            initial: (initial) async => await _handleHeadEffect(
                _entryCollection.buildInitialHeadEffect(initial.headEntryRef),
                emit),
            ready: (ready) async => await _handleHeadEffect(
                _entryCollection.buildMergeHeadEffect(ready.entryRef), emit)));

    subscription = onUpdate.listen((_) {
      add(EventSourceEvent.entryCollectionUpdate());
    });
  }

  @override
  @protected
  @mustCallSuper
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    _dispatcher.propagate(error, stackTrace);
  }

  Future<void> _handleHeadEffect(
      HeadEffect<Event> headEffect, Emitter<EventSourceState> emit) async {
    await _dispatcher.dispatch(headEffect);
    emit(headEffect.map(
        append: (append) => EventSourceState.ready(append.entry.ref),
        forward: (forward) => EventSourceState.ready(forward.entries.last.ref),
        reset: (reset) => EventSourceState.ready(reset.entries.last.ref),
        none: (none) => state));
  }

  void execute(Iterable<Command> commands) =>
      add(EventSourceEvent.commandsApply(commands));
}
