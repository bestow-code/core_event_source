import 'package:bloc_test/bloc_test.dart';
import 'package:core_event_source/entry.dart';
import 'package:core_event_source/internal.dart';
import 'package:core_event_source/src/event_sourced_behavior/event_sourced_behavior_effect.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../util/debug_bloc_observer.dart';
import 'test_common.dart';

class MockStream<T> extends Mock implements Stream<T> {}

class UpdatesBlocMock extends MockCubit {}

class MockCommandProcessor<Command, Event, State> extends Mock
    implements CommandProcessor<Command, Event, State> {}

class MockJournalImpl<Event> extends Mock implements JournalImpl<Event> {}

class MockValueImpl<Event, T> extends Mock implements ValueImpl<Event, T> {}

class MockEntryCollectionImpl<Event>
    extends MockCubit<EntryCollectionState<Event>>
    implements EntryCollectionImpl<Event> {}

class MockHeadEffectDispatcher<Event> extends Mock
    implements HeadEffectDispatcher<Event> {}

class MockHeadEffect<Event> extends Mock implements HeadEffect<Event> {}

class MockEntryCollectionState<Event> extends Mock
    implements EntryCollectionState<Event> {}

class MockEntry<Event> extends Mock implements Entry<Event> {}

main() {
  DebugBlocObserver.observe();
  setUpAll(() {
    registerFallbackValue(HeadEffect<Event>.none());
  });
  late EventSourceInternal<Command, Event, State> internal;

  late MockCommandProcessor<Command, Event, State> commandProcessor;
  late MockValueImpl<Event, State> stateValue;
  late MockEntryCollectionImpl<Event> entryCollection;
  late MockHeadEffectDispatcher<Event> dispatcher;

  buildMocks() {
    commandProcessor = MockCommandProcessor<Command, Event, State>();
    stateValue = MockValueImpl<Event, State>();
    entryCollection = MockEntryCollectionImpl<Event>();
    dispatcher = MockHeadEffectDispatcher();
  }

  buildEventSource() {
    internal = EventSourceInternal(
      EventSourceState.ready(EntryRef.root),
      commandProcessor: commandProcessor,
      stateValue: stateValue,
      dispatcher: dispatcher,
      entryCollection: entryCollection,
      onUpdate: entryCollection.stream,
    );
  }

  group('EventSourceInternal', () {
    group(
      'initialization',
      () {
        const ref1 = EntryRef('1');
        blocTest(
          'success - headRef path exists',
          setUp: () {
            buildMocks();
            whenListen(entryCollection,
                Stream.fromIterable([MockEntryCollectionState<Event>()]));
            final entry = MockEntry<Event>();
            when(() => entry.ref).thenReturn(ref1);
            when(() => entryCollection.buildInitial(ref1))
                .thenReturn(HeadEffect.forward(EntryRef.root, [entry]));
            when(() => stateValue.current).thenReturn(1);
            when(() => dispatcher.dispatch(any()))
                .thenAnswer((_) async => Null);
            buildEventSource();
          },
          build: () => internal,
          seed: () => EventSourceState.initial(ref1),
          // act: (source) => source.execute([{}]),
          expect: () => [isA<EventSourceStateReady>()],
        );
      },
    );
    group('success - persist', () {
      blocTest(
        'success - persist',
        setUp: () {
          buildMocks();
          final updatesMock = UpdatesBlocMock();
          whenListen(updatesMock, Stream.fromIterable([]));
          when(() => entryCollection.updates).thenReturn(updatesMock);

          buildEventSource();
          when(() => commandProcessor.apply(1, [{}]))
              .thenReturn(EventSourcedBehaviorEffect<Event>.persist([{}]));
          when(() => stateValue.current).thenReturn(1);
          when(() => dispatcher.dispatch(any())).thenAnswer((_) async => Null);
        },
        build: () => internal,
        seed: () => EventSourceState.ready(EntryRef.root),
        act: (source) => source.execute([{}]),
        expect: () => [isA<EventSourceStateReady>()],
      );
    });
    group('command execution', () {
      blocTest('source not ready - fail',
          setUp: () {
            buildMocks();
            final updatesMock = UpdatesBlocMock();
            whenListen(updatesMock, Stream.fromIterable([]));
            when(() => entryCollection.updates).thenReturn(updatesMock);
            when(() => dispatcher.dispatch(any()))
                .thenAnswer((_) async => Null);

            buildEventSource();
          },
          build: () => internal,
          seed: () => EventSourceState.initial(
              // EntryRef.root,
              EntryRef.root),
          act: (source) => source.execute([{}]),
          errors: () => [isA<EventSourceEventCommandsApply<Command, Event>>()]);

      group('success - no effect', () {
        blocTest(
          'success - persist nothing',
          setUp: () {
            buildMocks();
            final updatesMock = UpdatesBlocMock();
            whenListen(updatesMock, Stream.fromIterable([]));
            when(() => entryCollection.updates).thenReturn(updatesMock);
            buildEventSource();
            when(() => commandProcessor.apply(1, [{}]))
                .thenReturn(EventSourcedBehaviorEffect<Event>.none());
            when(() => dispatcher.dispatch(any()))
                .thenAnswer((_) async => Null);
            // when(() => journal.apply(any())).thenAnswer((_) async => Null);

            when(() => stateValue.current).thenReturn(1);
          },
          build: () => internal,
          seed: () => EventSourceState.ready(EntryRef.root),
          act: (source) => source.execute([{}]),
          expect: () => [],
        );
      });
      group('not supported', () {
        blocTest(
          'command not supported',
          setUp: () {
            buildMocks();
            final updatesMock = UpdatesBlocMock();
            whenListen(updatesMock, Stream.fromIterable([]));
            when(() => entryCollection.updates).thenReturn(updatesMock);
            buildEventSource();
            when(() => dispatcher.dispatch(any()))
                .thenAnswer((_) async => Null);

            when(() => commandProcessor.apply(1, [{}])).thenReturn(
                EventSourcedBehaviorEffect<Event>.notSupported('Error'));
            when(() => stateValue.current).thenReturn(1);
          },
          build: () => internal,
          seed: () => EventSourceState.ready(EntryRef.root),
          act: (source) => source.execute([{}]),
          errors: () => [isA<EventSourcedBehaviorEffectNotSupported<Event>>()],
        );
      });
    });

    group(
      'entry collection update',
      () {
        blocTest('source not ready - fail',
            setUp: () {
              buildMocks();
              final updatesMock = UpdatesBlocMock();
              whenListen(updatesMock,
                  Stream.fromIterable([EventSourceStateReady(EntryRef.root)]));
              when(() => entryCollection.updates).thenReturn(updatesMock);
              // when(() => entryCollection.buildMerge(EntryRef.root));
              buildEventSource();
            },
            build: () => internal,
            seed: () => EventSourceState.initial(
                // EntryRef.root,
                EntryRef.root),
            errors: () =>
                [isA<EventSourceEventEntryCollectionUpdate<Command, Event>>()]);
        blocTest('persist',
            setUp: () {
              buildMocks();
              final updatesMock = UpdatesBlocMock();
              whenListen(updatesMock, Stream.fromIterable([Null]));
              when(() => entryCollection.updates).thenReturn(updatesMock);
              when(() => entryCollection.buildMerge(EntryRef.root))
                  .thenReturn(HeadEffect.none());
              when(() => dispatcher.dispatch(any()))
                  .thenAnswer((_) async => Null);
              buildEventSource();
            },
            build: () => internal,
            expect: () => [isA<EventSourceState>()]);
        test('main', () {});
        // blocTest('main entry ahead', build: () => eventSourceImpl);

        // blocTest('main entry diverged', build: () => eventSourceImpl);
        // blocTest('main entry behind', build: () => eventSourceImpl);
        // blocTest('main entry up-to-date', build: () => eventSourceImpl);
        // blocTest('main entry path unavailable',
        //     build: () => eventSourceImpl);
      },
      skip: true,
    );
  });
}
