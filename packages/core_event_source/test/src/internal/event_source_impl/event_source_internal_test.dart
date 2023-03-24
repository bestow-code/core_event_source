import 'package:bloc_test/bloc_test.dart';
import 'package:core_event_source/entry.dart';
import 'package:core_event_source/internal.dart';
import 'package:core_event_source/src/event_sourced_behavior/event_sourced_behavior_effect.dart';
import 'package:core_event_source_test_util/core_event_source_test_util.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockStream<T> extends Mock implements Stream<T> {}

class UpdatesBlocMock extends MockCubit {}

class MockCommandProcessor extends Mock
    implements CommandProcessor<FakeCommand, FakeEvent, FakeState> {}

class MockJournalImpl extends Mock implements JournalImpl<FakeEvent> {}

class MockValueImpl<T> extends Mock implements ValueImpl<FakeEvent, T> {}

class MockEntryCollectionImpl extends MockCubit<EntryCollectionState<FakeEvent>>
    implements EntryCollectionImpl<FakeEvent> {}

class MockHeadEffectDispatcher extends Mock
    implements HeadEffectDispatcher<FakeEvent> {}

class MockHeadEffect extends Mock implements HeadEffect<FakeEvent> {}

class MockEntryCollectionState extends Mock
    implements EntryCollectionState<FakeEvent> {}

class MockEntry extends Mock implements Entry<FakeEvent> {}

main() {
  setUpAll(() {
    registerFallbackValue(HeadEffect<FakeEvent>.none());
  });
  late EventSourceInternal<FakeCommand, FakeEvent, FakeState> internal;

  late MockCommandProcessor commandProcessor;
  late MockValueImpl<FakeState> stateValue;
  late MockEntryCollectionImpl entryCollection;
  late MockHeadEffectDispatcher dispatcher;
  late EntryFactory<FakeEvent> entryFactory;

  buildMocks() {
    commandProcessor = MockCommandProcessor();
    stateValue = MockValueImpl<FakeState>();
    when(() => stateValue.close()).thenAnswer((invocation) async => null);
    entryCollection = MockEntryCollectionImpl();
    when(() => entryCollection.close()).thenAnswer((invocation) async => null);

    dispatcher = MockHeadEffectDispatcher();
    when(() => dispatcher.close()).thenAnswer((invocation) async => null);
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
    internal.start();
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
                Stream.fromIterable([MockEntryCollectionState()]));
            final entry = MockEntry();
            when(() => entry.ref).thenReturn(ref1);
            when(() => entryCollection.buildInitialHeadEffect(ref1))
                .thenReturn(HeadEffect.forward(EntryRef.root, [entry]));
            when(() => stateValue.current).thenReturn(FakeState(1));
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
          when(() => commandProcessor.apply(FakeState(1), [FakeCommand()]))
              .thenReturn(
                  EventSourcedBehaviorEffect<FakeEvent>.persist([FakeEvent()]));
          when(() => stateValue.current).thenReturn(FakeState(1));
          when(() => dispatcher.dispatch(any())).thenAnswer((_) async => Null);
        },
        build: () => internal,
        seed: () => EventSourceState.ready(EntryRef.root),
        act: (source) => source.execute([FakeCommand()]),
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
          act: (source) => source.execute([FakeCommand()]),
          errors: () =>
              [isA<EventSourceEventCommandsApply<FakeCommand, FakeEvent>>()]);

      group('success - no effect', () {
        blocTest(
          'success - persist nothing',
          setUp: () {
            buildMocks();
            final updatesMock = UpdatesBlocMock();
            whenListen(updatesMock, Stream.fromIterable([]));
            when(() => entryCollection.updates).thenReturn(updatesMock);
            buildEventSource();
            when(() => commandProcessor.apply(FakeState(1), [FakeCommand()]))
                .thenReturn(EventSourcedBehaviorEffect<FakeEvent>.none());
            when(() => dispatcher.dispatch(any()))
                .thenAnswer((_) async => Null);
            // when(() => journal.apply(any())).thenAnswer((_) async => Null);

            when(() => stateValue.current).thenReturn(FakeState(1));
          },
          build: () => internal,
          seed: () => EventSourceState.ready(EntryRef.root),
          act: (source) => source.execute([FakeCommand()]),
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

            when(() => commandProcessor.apply(FakeState(1), [FakeCommand()]))
                .thenReturn(EventSourcedBehaviorEffect<FakeEvent>.notSupported(
                    'Error'));
            when(() => stateValue.current).thenReturn(FakeState(1));
          },
          build: () => internal,
          seed: () => EventSourceState.ready(EntryRef.root),
          act: (source) => source.execute([FakeCommand()]),
          errors: () =>
              [isA<EventSourcedBehaviorEffectNotSupported<FakeEvent>>()],
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
            errors: () => [
                  isA<
                      EventSourceEventEntryCollectionUpdate<FakeCommand,
                          FakeEvent>>()
                ]);
        blocTest('persist',
            setUp: () {
              buildMocks();
              final updatesMock = UpdatesBlocMock();
              whenListen(updatesMock, Stream.fromIterable([Null]));
              when(() => entryCollection.updates).thenReturn(updatesMock);
              entryFactory = EntryFactory.increment();
              when(() => entryCollection.buildMergeHeadEffect(
                  EntryRef.root, entryFactory)).thenReturn(HeadEffect.none());
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
