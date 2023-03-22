import 'package:core_event_source/common.dart';
import 'package:core_event_source/internal.dart';
import 'package:core_event_source/entry.dart';
import 'package:directed_graph/directed_graph.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class StreamMock<T> extends Mock implements Stream<T> {}

DateTime t(int millisecondsSinceEpoch) =>
    DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

typedef Command = JsonObject;
typedef Event = JsonObject;
typedef State = int;
typedef View = int;

main() {
  // late EntryCollectionState<Event> state;
  late DateTimeFactory dateTimeFactory;
  late EntryFactory<Event> entryFactory;
  late EntryRefFactory entryRefFactory;
  late Stream<EntryRef> mainRefUpdateStream;
  late Stream<Iterable<EntrySnapshot<Event>>> entrySnapshotsStream;

  Iterable<Entry<Event>> buildEntries<Event>(
          Map<String, Set<String>> parentRefs) =>
      parentRefs.entries.map((e) => entryFactory.create(
          ref: EntryRef(e.key),
          refs: e.value.map(EntryRef.new),
          events: []) as Entry<Event>);

  setUp(() {
    entryRefFactory = EntryRefFactory.increment();
    dateTimeFactory = DateTimeFactory.increment();
    entryFactory = EntryFactory(
        entryRefFactory: entryRefFactory, dateTimeFactory: dateTimeFactory);

    entrySnapshotsStream = Stream.fromIterable([]);
    mainRefUpdateStream = Stream.fromIterable([]);
  });

  group('build merge effects', () {
    setUp(() {
      entryRefFactory = EntryRefFactory.increment();
      dateTimeFactory = DateTimeFactory.increment();
      entryFactory = EntryFactory(
          entryRefFactory: entryRefFactory, dateTimeFactory: dateTimeFactory);

      entrySnapshotsStream = Stream.fromIterable([]);
      mainRefUpdateStream = Stream.fromIterable([]);
    });
    Map<Entry<Event>, Set<Entry<Event>>> buildEntryEdges<Event>(
            Map<EntryRef, Entry<Event>> entries) =>
        entries.map((key, value) => MapEntry(
            entries[key]!, entries[key]!.refs.map((e) => entries[e]!).toSet()));

    buildEntryCollection<Event>(Entry<Event> initialEntry,
        EntryRef mainEntryRef, Map<EntryRef, Entry<Event>> entries) {
      final state = EntryCollectionState<Event>(
        mainEntryRef: mainEntryRef,
        entries: entries,
        graph: DirectedGraph(buildEntryEdges<Event>(entries)),
        pending: {},
      );
      return EntryCollectionImpl<Event>(
        state,
        initialEntry: initialEntry,
        mainEntryRefStream: mainRefUpdateStream,
        entrySnapshotsStream:
            entrySnapshotsStream as Stream<Iterable<EntrySnapshot<Event>>>,
        onError: (e, s) {
          print(e.toString());
          print(s.toString());
          // debugPrintStack(label: e.toString(), stackTrace: s);
        },
      );
    }

    group('up-to-date', () {
      test('main', () {
        final entries = buildEntries({
          'a': {},
        });
        final initialEntry = entries.first;
        final headRef = initialEntry.ref;
        final mainEntryRef = initialEntry.ref;
        final collection = buildEntryCollection(initialEntry, mainEntryRef,
            Map.fromEntries(entries.map((e) => MapEntry(e.ref, e))));
        final effect = collection.buildMergeHeadEffect(headRef);
        expect(effect, HeadEffect.none());
      });
    });
    group(
      'head entry behind - forward',
      () {
        test('main', () {
          final entries = buildEntries({
            'a': {},
            'b': {'a'}
          });
          var entriesMap =
              Map.fromEntries(entries.map((e) => MapEntry(e.ref, e)));
          const refA = EntryRef('a');
          const refB = EntryRef('b');
          final entryA = entriesMap[refA]!;
          final entryB = entriesMap[refB]!;
          final initialEntry = entryA;
          const headRef = refA;
          const mainEntryRef = refB;
          final collection =
              buildEntryCollection(initialEntry, mainEntryRef, entriesMap);
          final effect = collection.buildMergeHeadEffect(headRef);
          expect(effect, HeadEffect.forward(headRef, [entryB]));
        });
      },
      skip: true,
    );
    group('head entry diverge - merge', () {
      test(
        'main',
        () {
          final entries = buildEntries({
            'a': {},
            'b': {'a'},
            'c': {'a'}
          });
          var entriesMap =
              Map.fromEntries(entries.map((e) => MapEntry(e.ref, e)));
          const refA = EntryRef('a');
          const refB = EntryRef('b');
          const refC = EntryRef('c');
          final entryA = entriesMap[refA]!;
          final entryB = entriesMap[refB]!;
          final entryC = entriesMap[refC]!;
          final initialEntry = entryA;
          const headRef = refC;
          const mainEntryRef = refB;
          final collection =
              buildEntryCollection(initialEntry, mainEntryRef, entriesMap);
          final effect = collection.buildMergeHeadEffect(headRef);
          expect(effect, HeadEffect.reset(headRef, [refA], [entryB, entryC]));
        },
        skip: true,
      );
    });
    group('head entry ahead - dispatch main ref update', () {
      test(
        'main',
        () {
          final entries = buildEntries({
            'a': {},
            'b': {'a'}
          });
          var entriesMap =
              Map.fromEntries(entries.map((e) => MapEntry(e.ref, e)));
          const refA = EntryRef('a');
          const refB = EntryRef('b');
          final entryA = entriesMap[refA]!;
          final initialEntry = entryA;
          const headRef = refA;
          const mainEntryRef = refB;
          final collection =
              buildEntryCollection(initialEntry, mainEntryRef, entriesMap);
          final effect = collection.buildMergeHeadEffect(headRef);
          expect(effect, HeadEffect.none());
        },
        skip: true,
      );
    });
  });

  group('updates', () {
    group('entry collection updates', () {
      test('collection update handler', () {});
    });
    group('main entry ref updates', () {});
  });
  group('status unknown', () {
    test('main entry path unavailable', () {
      // final entries = buildEntries({
      //   'a': {},
      // });
      // final initialEntry = entries.first;
      // final headRef = initialEntry.ref;
      // final mainEntryRef = initialEntry.ref;
      // final collection = buildEntryCollection(initialEntry, mainEntryRef,
      //     Map.fromEntries(entries.map((e) => MapEntry(e.ref, e))));
      // final effect = collection.buildMergeEffect(headRef);
      // expect(effect, EventSourceEffect.none());
    });
  });
}
