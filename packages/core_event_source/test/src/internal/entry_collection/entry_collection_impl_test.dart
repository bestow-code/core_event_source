import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core_event_source/common.dart';
import 'package:core_event_source/entry.dart';
import 'package:core_event_source/internal.dart';
import 'package:logging/logging.dart';
import 'package:test/test.dart';

// class StreamMock<T> extends Mock implements Stream<T> {}
// a-b-c-f
//  -d-e

typedef Event = JsonObject;
// {'a', {},
// 'b': {'a'},
// 'c': {'b'},
// 'd': {'a'},
// 'f':{'c','e'},
// }
Map<EntryRef, Entry<Event>> buildTestEntries<Event>(
  EntryFactory<Event> factory,
  Map<String, Set<String>> edges,
) =>
    edges.map(
      (ref, refs) => MapEntry(
        EntryRef(ref),
        factory.create(
            ref: EntryRef(ref), refs: refs.map(EntryRef.new), events: []),
      ),
    );
final logger = Logger('test111');

main() {
  // initializeDebugLogging();
  logger.fine('hello world');
  late EntryCollectionImpl<Event> entryCollection;

  late Stream<Iterable<EntrySnapshot<Event>>> entrySnapshotsStream;
  late Stream<EntryRef> mainEntryRefStream;

  // late Map<String, Set<String>> edges;
  // late Map<String, Iterable<Event>> events;
  late Map<EntryRef, Entry<Event>> entries;

  late Entry<Event> rootEntry;
  late EntryRef mainEntryRef;
  // late Entry<Event> headEntry;

  late EntryFactory<Event> entryFactory;
  late EntryFactory<Event> entryFactory2;

  initialize(
    EntryFactory<Event> factory,
    String mainRef,
    Map<String, Set<String>> edges, {
    Stream<Iterable<EntrySnapshot<Event>>> Function(
            Map<EntryRef, Entry<Event>>)?
        entrySnapshotsStream2,
    Stream<EntryRef> Function(Map<EntryRef, Entry<Event>>)? mainEntryRefStream2,
  }) {
    mainEntryRef = EntryRef(mainRef);

    entries = buildTestEntries(factory, edges);

    rootEntry = entries.values.firstWhere((element) => element.refs.isEmpty);

    entrySnapshotsStream = entrySnapshotsStream2 != null
        ? entrySnapshotsStream2(entries)
        : Stream.fromIterable([
            entries.values.map((e) => EntrySnapshot<Event>(e, isPending: false))
          ]);

    mainEntryRefStream = mainEntryRefStream2 != null
        ? mainEntryRefStream2(entries)
        : Stream.fromIterable([]);

    entryCollection = EntryCollectionImpl.initial(
      rootEntry,
      mainEntryRef,
      onError: (e, s) {
        printOnFailure(e.toString());
      },
      mainEntryRefStream: mainEntryRefStream,
      entrySnapshotsStream: entrySnapshotsStream,
    );
    entryCollection.start();
  }

  group('Entry Collection', () {
    setUp(() => entryFactory = EntryFactory.increment());
    setUp(() => entryFactory2 = EntryFactory.increment());
    group('apply entry', () {
      blocTest(
        'apply entry',
        setUp: () {
          initialize(
            entryFactory,
            'a',
            {'a': {}},
          );
        },
        build: () => entryCollection,
        act: (entryCollection) => entryCollection.apply(HeadEffect.append(
            const EntryRef('a'),
            entryFactory.create(refs: [const EntryRef('a')], events: []))),
        expect: () => [isA<EntryCollectionState>()],
      );
    });

    group('main entry update', () {
      blocTest(
        'main entry update',
        setUp: () {
          initialize(
              entryFactory,
              'a',
              {
                'a': {},
                'b': {'a'}
              },
              mainEntryRefStream2: (entries) => Stream.fromIterable(
                  [const EntryRef('a'), const EntryRef('b')]));
        },
        build: () => entryCollection,
        act: (entryCollection) => entryCollection,
        expect: () => [isA<EntryCollectionState<Event>>()],
      );
    });
    group('entry snapshots', () {
      blocTest('new-pending entry',
          setUp: () {
            initialize(entryFactory, 'a', {'a': {}},
                entrySnapshotsStream2: (entries) => Stream.fromIterable(
                      [
                        entries.values.map(
                            (e) => EntrySnapshot<Event>(e, isPending: false)),
                        [
                          EntrySnapshot(
                              entryFactory
                                  .create(refs: [mainEntryRef], events: []),
                              isPending: true)
                        ]
                      ],
                    ));
          },
          build: () => entryCollection,
          expect: () => [isA<EntryCollectionState>()]);
    });

    group('buildFollowMainEffect', () {
      // setUp(() => entryFactory = EntryFactory.increment(4));
      // setUp(() => entryFactory2 = EntryFactory.increment(4));

      blocTest('headEntryRef == mainEntryRef',
          setUp: () {
            initialize(
              entryFactory,
              'a',
              {'a': {}},
            );
          },
          build: () => entryCollection,
          verify: (entryCollection) {
            expect(
                entryCollection.buildMergeHeadEffect(
                    mainEntryRef, entryFactory),
                HeadEffect<Event>.none());
          });
      blocTest('mainEntryRef unknown',
          setUp: () {
            initialize(
                entryFactory,
                'a',
                {
                  'a': {},
                  'b': {'a'}
                },
                mainEntryRefStream2: (entries) => Stream.fromIterable(
                    [const EntryRef('a'), const EntryRef('c')]));
          },
          build: () => entryCollection,
          verify: (entryCollection) {
            expect(
                entryCollection.buildMergeHeadEffect(
                    const EntryRef('b'), entryFactory),
                HeadEffect<Event>.none());
          });
      blocTest('headEntryRef unknown',
          setUp: () {
            initialize(
              entryFactory,
              'a',
              {
                'a': {},
                'b': {'a'}
              },
            );
          },
          build: () => entryCollection,
          verify: (entryCollection) {
            expect(
                entryCollection.buildMergeHeadEffect(
                    const EntryRef('c'), entryFactory),
                HeadEffect<Event>.none());
          });
      blocTest('headEntryRef and mainEntryRef diverged',
          setUp: () {
            entryFactory = EntryFactory.increment();
            entryFactory2 = EntryFactory.increment();
            entryFactory2.create(refs: [], events: []);
            entryFactory2.create(refs: [], events: []);
            entryFactory2.create(refs: [], events: []);
            initialize(
              entryFactory,
              'b',
              {
                'a': {},
                'b': {'a'},
                'c': {'a'}
              },
            );
            // entryFactory.dateTimeFactory.create();
            // entryFactory2.dateTimeFactory.create();
          },
          build: () => entryCollection,
          verify: (entryCollection) {
            final mergeEntry = entryFactory2.create(refs: [
              EntryRef('c'),
              EntryRef('b'),
            ], events: []);
            expect(
                entryCollection.buildMergeHeadEffect(
                    const EntryRef('c'), entryFactory),
                HeadEffect<Event>.merge(
                    const EntryRef('c'),
                    [const EntryRef('a')],
                    [
                      entries[const EntryRef('b')]!,
                      entries[const EntryRef('c')]!,
                      mergeEntry,
                    ],
                    entry: mergeEntry));
          });
      blocTest('mainEntryRef ahead of headEntryRef ',
          setUp: () {
            initialize(
              entryFactory,
              'b',
              {
                'a': {},
                'b': {'a'},
              },
            );
          },
          build: () => entryCollection,
          verify: (entryCollection) {
            expect(
                entryCollection.buildMergeHeadEffect(
                    const EntryRef('a'), entryFactory),
                HeadEffect<Event>.forward(
                  const EntryRef('a'),
                  [entryCollection.state.entries[const EntryRef('b')]!],
                ));
          });
      blocTest('mainEntryRef behind headEntryRef ',
          setUp: () {
            initialize(
              entryFactory,
              'a',
              {
                'a': {},
                'b': {'a'},
              },
            );
          },
          build: () => entryCollection,
          verify: (entryCollection) {
            expect(
                entryCollection.buildMergeHeadEffect(
                    const EntryRef('b'), entryFactory),
                HeadEffect<Event>.none());
          });
    });
    group('updates stream', () {
      blocTest<BlocBase<void>, void>(
        'emits',
        setUp: () {
          initialize(
            entryFactory,
            'a',
            {'a': {}},
          );
        },
        build: () => entryCollection.updates,
        act: (_) => entryCollection.apply(HeadEffect.append(const EntryRef('a'),
            entryFactory.create(refs: [const EntryRef('a')], events: []))),
        expect: () => [isA<EntryCollectionState>()],
      );
    });
  });
}

// _main() {
//   late EntryCollection<Event> entryCollection;
//   late Entry<Event> initialEntry;
//   late EntryRef mainEntryRef;
//   late Entry<Event> entry1;
//   late DateTimeFactory dateTimeFactory;
//   late EntryFactory<Event> entryFactory;
//   late EntryRefFactory entryRefFactory;
//   late Stream<EntryRef> mainRefUpdateStream;
//   late Stream<Iterable<EntrySnapshot<Event>>> entrySnapshotsStream;
//
//   setUp(() {
//     initialEntry = Entry.epoch();
//     mainEntryRef = initialEntry.ref;
//     entryRefFactory = EntryRefFactory.increment();
//     dateTimeFactory = DateTimeFactory.increment();
//
//     entryFactory = EntryFactory(
//         entryRefFactory: entryRefFactory, dateTimeFactory: dateTimeFactory);
//
//     entrySnapshotsStream = Stream.fromIterable([]);
//     mainRefUpdateStream = Stream.fromIterable([]);
//     entryCollection = EntryCollectionImpl.initial(
//       initialEntry,
//       mainEntryRef,
//       mainEntryRefStream: mainRefUpdateStream,
//       entrySnapshotsStream: entrySnapshotsStream,
//     );
//   });
//
//   group('build merge effects', () {
//     setUp(() {
//       initialEntry = Entry.epoch();
//       mainEntryRef = initialEntry.ref;
//       entryRefFactory = EntryRefFactory.increment();
//       dateTimeFactory = DateTimeFactory.increment();
//       entryFactory = EntryFactory(
//           entryRefFactory: entryRefFactory, dateTimeFactory: dateTimeFactory);
//
//       entrySnapshotsStream = Stream.fromIterable([]);
//       mainRefUpdateStream = Stream.fromIterable([]);
//       entryCollection = EntryCollectionImpl.initial(
//         initialEntry,
//         mainEntryRef,
//         mainEntryRefStream: mainRefUpdateStream,
//         entrySnapshotsStream: entrySnapshotsStream,
//       );
//     });
//     Map<Entry<Event>, Set<Entry<Event>>> buildEntryEdges<Event>(
//             Map<EntryRef, Entry<Event>> entries) =>
//         entries.map((key, value) => MapEntry(
//             entries[key]!, entries[key]!.refs.map((e) => entries[e]!).toSet()));
//
//     buildEntryCollection<Event>(Entry<Event> initialEntry,
//         EntryRef mainEntryRef, Map<EntryRef, Entry<Event>> entries) {
//       final state = EntryCollectionState<Event>(
//         mainEntryRef: mainEntryRef,
//         entries: entries,
//         graph: DirectedGraph(buildEntryEdges<Event>(entries)),
//         pending: {},
//       );
//       return EntryCollectionImpl<Event>(
//         state,
//         initialEntry: initialEntry,
//         mainEntryRefStream: mainRefUpdateStream,
//         entrySnapshotsStream:
//             entrySnapshotsStream as Stream<Iterable<EntrySnapshot<Event>>>,
//       );
//     }
//
//     group('merge effects - none', () {
//       test('up-to-date', () {
//         final entries = buildTestEntries({
//           'a': {},
//         });
//         final initialEntry = entries.first;
//         final headRef = initialEntry.ref;
//         final mainEntryRef = initialEntry.ref;
//         final collection = buildEntryCollection(initialEntry, mainEntryRef,
//             Map.fromEntries(entries.map((e) => MapEntry(e.ref, e))));
//         final effect = collection.buildMerge(headRef);
//         expect(effect, HeadEffect.none());
//       });
//       test('main entry path unavailable', () {
//         // final entries = buildEntries({
//         //   'a': {},
//         // });
//         // final initialEntry = entries.first;
//         // final headRef = initialEntry.ref;
//         // final mainEntryRef = initialEntry.ref;
//         // final collection = buildEntryCollection(initialEntry, mainEntryRef,
//         //     Map.fromEntries(entries.map((e) => MapEntry(e.ref, e))));
//         // final effect = collection.buildMergeEffect(headRef);
//         // expect(effect, EventSourceEffect.none());
//       });
//     });
//     group('merge effects - forward', () {
//       test('head entry behind', () {
//         final entries = buildTestEntries({
//           'a': {},
//           'b': {'a'}
//         });
//         var entriesMap =
//             Map.fromEntries(entries.map((e) => MapEntry(e.ref, e)));
//         final refA = EntryRef('a');
//         final refB = EntryRef('b');
//         final entryA = entriesMap[refA]!;
//         final entryB = entriesMap[refB]!;
//         final initialEntry = entryA;
//         final headRef = refA;
//         final mainEntryRef = refB;
//         final collection =
//             buildEntryCollection(initialEntry, mainEntryRef, entriesMap);
//         final effect = collection.buildMerge(headRef);
//         // fail('incomplete');
//         // expect(effect, HeadEffect.merge(mainEntryRef, [entryB]));
//       });
//     });
//     group('merge effects - reset', () {});
//   });
//   group('entry collection changes', () {
//     group('entry ', () {
//       test('collection update handler', () {});
//     });
//     group('main entry ref updates', () {});
//   });
// }
