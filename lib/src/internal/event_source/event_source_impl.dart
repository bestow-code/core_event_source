import 'package:bloc/bloc.dart' hide EventHandler;
import 'package:core_event_source/event_source.dart';
import 'package:core_event_source/internal.dart';
import 'package:core_event_source/src/internal/data_store/in_memory_data_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entry.dart';
import '../../../event_sourced_behavior.dart';

part 'event_source_impl.freezed.dart';

part 'event_source_impl.model.dart';

class EventSourceImpl<Command, Event, State, View> extends BlocBase<View>
    implements EventSource<Command, View> {
  final EventSourceInternal<Command, Event, State> _internal;
  final Value<Event, View> _viewValue;

  EventSourceImpl({
    required Value<Event, View> viewValue,
    required EventSourceInternal<Command, Event, State> internal,
  })  : _viewValue = viewValue,
        _internal = internal,
        super(viewValue.current) {
    _viewValue.source.stream.listen((emit));
  }

  @override
  void execute(Iterable<Command> commands) => _internal.execute(commands);

  @override
  void pause() {
    // TODO: implement pause
  }

  @override
  void resume() {
    // TODO: implement resume
  }

  static Future<EventSource<Command, View>> from<Command, Event, State, View>(
      {required InMemoryDataStore<Event> dataStore,
      required EventSourcedBehavior<Command, Event, State, View> behavior,
      EntryFactory<Event>? entryFactory}) async {
    entryFactory ??= EntryFactory<Event>.randomRefCreatedNow();
    final initialEntryIfEmpty =
        entryFactory.create(ref: EntryRef.root, refs: [], events: []);
    await dataStore.initialize(initialEntryIfEmpty);
    final dispatcher = HeadEffectDispatcherImpl<Event>();

    final journal = JournalImpl(
      adapter: dataStore,
    );
    dispatcher.registerJournal(journal);

    final rootEntry = await dataStore.rootEntry;
    final mainEntryRef = await dataStore.mainEntryRef;
    final entryCollection = EntryCollectionImpl.initial(
      rootEntry,
      mainEntryRef,
      mainEntryRefStream: dataStore.mainEntryRefStream,
      entrySnapshotsStream: dataStore.entrySnapshotsStream,
      onError: dispatcher.propagate,
    );
    dispatcher.registerHandler(entryCollection);

    final stateValue = ValueImpl.initial(
        rootEntry.ref, behavior.initialState, behavior.eventHandler,
        onError: dispatcher.propagate);
    dispatcher.registerHandler(stateValue);

    final viewValue = ValueImpl.initial(
        rootEntry.ref, behavior.initialView, behavior.viewHandler,
        onError: dispatcher.propagate);
    dispatcher.registerHandler(viewValue);

    final headEntryRef = await dataStore.headEntryRef ?? mainEntryRef;

    final initialState = headEntryRef == rootEntry.ref
        ? EventSourceState.ready(headEntryRef)
        : EventSourceState.initial(headEntryRef);

    final commandProcessor = CommandProcessor(
        commandHandler: behavior.commandHandler,
        eventHandler: behavior.eventHandler);

    final internal = EventSourceInternal(
      initialState,
      dispatcher: dispatcher,
      commandProcessor: commandProcessor,
      stateValue: stateValue,
      entryCollection: entryCollection,
      onUpdate: entryCollection.stream,
    );

    final source = EventSourceImpl(internal: internal, viewValue: viewValue);
    dispatcher.registerErrorHandler(source.addError);
    entryCollection.start();

    return source;
  }
}
