import 'package:bloc_test/bloc_test.dart';
import 'package:core_event_source/entry.dart';
import 'package:core_event_source/internal.dart';
import 'package:core_event_source_test_util/core_event_source_test_util.dart';
// import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockJournal extends Mock implements Journal<FakeEvent> {}

class MockEntryCollection extends MockBloc<EntryCollection<FakeEvent>,
    EntryCollectionState<FakeEvent>> implements EntryCollection<FakeEvent> {}

class MockEntryCollectionState extends Mock
    implements EntryCollectionState<FakeEvent> {}

class MockEventSourceInternal extends Mock
    implements EventSourceInternal<FakeCommand, FakeEvent, FakeState> {}

main() {
  // # Subject
  // late MainRefUpdateDispatcherImpl mainRefUpdateDispatcherImpl;
  late MainRefEffect<FakeEvent> initialState;

  // # Mock Dependencies
  late MockJournal _journal;
  late MockEntryCollection _entryCollection;
  late MockEventSourceInternal _source;

  setUp(() {
    _journal = MockJournal();
    _entryCollection = MockEntryCollection();
    _source = MockEventSourceInternal();
    initialState = MainRefEffect.none();
  });

  MainRefUpdateDispatcherImpl<FakeCommand, FakeEvent, FakeState> build() =>
      MainRefUpdateDispatcherImpl<FakeCommand, FakeEvent, FakeState>(
          initialState, _journal, _source, _entryCollection);

  group('MainRefUpdateDispatcherImpl', () {
    group('given a path forward available', () {
      EntryRef entryRef1 = EntryRef('ref1');
      late MainRefEffect<FakeEvent> mainRefEffect;

      setUp(() {
        mainRefEffect =
            MainRefEffect.forward(previous: EntryRef.root, next: entryRef1);
        return when(() => _entryCollection.buildMainRefEffect(entryRef1))
            .thenReturn(mainRefEffect);
      });

      group('when eventSource emits', () {
        setUp(
          () => whenListen(
              _source, Stream.fromIterable([EventSourceState.ready(entryRef1)]),
              initialState: EventSourceState.ready(entryRef1)),
        );
        setUp(() => whenListen(_entryCollection,
            Stream.fromIterable(<MockEntryCollectionState>[])));
        test('then journal handler is called', () {
          build();
          when(() => _journal.applyMainRefEffect(mainRefEffect))
              .thenAnswer((invocation) async => null);
        });
      });
      group('when entryCollection emits', () {
        setUp(() => whenListen(_entryCollection,
            Stream.fromIterable([MockEntryCollectionState()])));
        setUp(() => whenListen(
            _source, Stream.fromIterable(<EventSourceState>[]),
            initialState: EventSourceState.ready(entryRef1)));
        setUp(() => when(() => _entryCollection.buildMainRefEffect(entryRef1))
            .thenReturn(mainRefEffect));
        setUp(() => when(() => _journal.applyMainRefEffect(mainRefEffect))
            .thenAnswer((invocation) async => null));
        blocTest(
          'journal handler is called',
          build: build,
          verify: (_) {
            verify(() => _journal.applyMainRefEffect(mainRefEffect)).called(1);
          },
        );
      });
    });
    test('path forward not available', () {});
    test('retry on connection failure', () {});
  });
}
