import 'package:bloc/bloc.dart' hide EventHandler;
import 'package:core_event_source/event_source.dart';
import 'package:core_event_source/internal.dart';
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

  static Future<EventSource<Command, View>> from<Command, Event, State, View>(
      {required CoreDataStore<Event> dataStore,
      required EventSourcedBehavior<Command, Event, State, View> behavior,
      EntryFactory<Event>? entryFactory}) async {
    entryFactory ??= EntryFactory<Event>.randomRefCreatedNow();
    final initialEntryIfEmpty =
        entryFactory.create(ref: EntryRef.root, refs: [], events: []);
    await dataStore.initialize(initialEntryIfEmpty);
    final headEffectDispatcher = HeadEffectDispatcherImpl<Event>();

    final journal = JournalImpl(
      adapter: dataStore,
    );
    headEffectDispatcher.registerJournal(journal);

    final rootEntry = await dataStore.rootEntry;
    final mainEntryRef = await dataStore.mainEntryRef;
    final entryCollection = EntryCollectionImpl.initial(
      rootEntry,
      mainEntryRef,
      mainEntryRefStream: dataStore.mainEntryRefStream,
      entrySnapshotsStream: dataStore.entrySnapshotsStream,
      onError: headEffectDispatcher.propagate,
    );
    headEffectDispatcher.registerHandler(entryCollection);

    final stateValue = ValueImpl.initial(
        rootEntry.ref, behavior.initialState, behavior.eventHandler,
        onError: headEffectDispatcher.propagate);
    headEffectDispatcher.registerHandler(stateValue);

    final viewValue = ValueImpl.initial(
        rootEntry.ref, behavior.initialView, behavior.viewHandler,
        onError: headEffectDispatcher.propagate);
    headEffectDispatcher.registerHandler(viewValue);

    final headEntryRef = await dataStore.headEntryRef ?? mainEntryRef;

    final initialState = headEntryRef == rootEntry.ref
        ? EventSourceState.ready(headEntryRef)
        : EventSourceState.initial(headEntryRef);

    final commandProcessor = CommandProcessor<Command, Event, State>(
        commandHandler: behavior.commandHandler,
        eventHandler: behavior.eventHandler);

    final internal = EventSourceInternal<Command, Event, State>(
      initialState,
      dispatcher: headEffectDispatcher,
      commandProcessor: commandProcessor,
      stateValue: stateValue,
      entryCollection: entryCollection,
      onUpdate: entryCollection.stream,
    );

    final source = EventSourceImpl<Command, Event, State, View>(
        internal: internal, viewValue: viewValue);
    headEffectDispatcher.registerErrorHandler(source.addError);

    MainRefUpdateDispatcherImpl<Command, Event, State>(
        MainRefEffect.none(), journal, internal, entryCollection);

    entryCollection.start();

    return source;
  }
}
