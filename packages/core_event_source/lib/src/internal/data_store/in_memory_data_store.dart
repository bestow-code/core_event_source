import 'dart:async';

import 'package:collection/collection.dart';
import 'package:core_event_source/internal.dart';
import 'package:rxdart/rxdart.dart';

import '../../../entry.dart';

class InMemoryDataStore<Event> implements CoreDataStore<Event> {
  final String _headRefName;
  final InMemoryDataStoreInternal<Event> _internal;

  InMemoryDataStore({
    required String headRefName,
    required InMemoryDataStoreInternal<Event> dataStoreInternal,
  })  : _internal = dataStoreInternal,
        _headRefName = headRefName;

  @override
  Future<void> initialize(Entry<Event> rootEntryIfEmpty) async {}

  @override
  Future<void> appendHeadEntry(
      Entry<Event> entry, HeadEntryRef headEntryRef) async {
    _internal.appendHeadEntry(entry, headEntryRef, headRefId: _headRefName);
  }

  @override
  Future<void> forwardHeadEntryRef(EntryRef previous, HeadEntryRef next) async {
    _internal.forwardHeadEntryRef(previous, next, headRefId: _headRefName);
  }

  @override
  Future<void> resetHeadEntryRef(EntryRef previous, HeadEntryRef next) async {
    _internal.resetHeadEntryRef(previous, next, headRefId: _headRefName);
  }

  @override
  Future<void> updateMainEntryRef(EntryRef previous, EntryRef next) async {
    _internal.updateMainEntryRef(previous, next);
  }

  @override
  Stream<Iterable<EntrySnapshot<Event>>> get entrySnapshotsStream =>
      _internal.entrySnapshotsStream;

  @override
  Future<HeadEntryRef?> get headEntryRef async =>
      _internal.headEntryRefs[_headRefName];

  @override
  Future<EntryRef> get mainEntryRef async => _internal.mainEntryRef;

  @override
  Stream<EntryRef> get mainEntryRefStream => _internal.mainEntryRefStream;

  @override
  Future<Entry<Event>> get rootEntry async => _internal.rootEntry;

  void addEntrySnapshots(List<EntrySnapshot<Event>> snapshots) =>
      _internal.addEntrySnapshots(snapshots);

  void setMainEntryRef(EntryRef ref) => _internal.setMainEntryRef(ref);

  @override
  Future<void> appendMergeEntry(Entry<Event> entry, HeadEntryRef headEntryRef) {
    // TODO: implement appendMergeEntry
    throw UnimplementedError();
  }
}

class InMemoryDataStoreInternal<Event> {
  final ReplaySubject<EntryRef> mainEntryRefSubject = ReplaySubject();

  final ReplaySubject<Iterable<EntrySnapshot<Event>>> _entryCollectionSnapshots;
  final ReplaySubject<EntryRef> _mainRefSnapshots;
  Map<String, HeadEntryRef> _headEntryRefs;
  final Entry<Event> _rootEntry;

  factory InMemoryDataStoreInternal.from({
    Iterable<EntrySnapshot<Event>>? entryCollectionSnapshots,
    Map<String, HeadEntryRef>? headEntryRefs,
    EntryRef? mainEntryRef,
  }) {
    final Entry<Event> rootEntry = Entry.newRoot();
    return InMemoryDataStoreInternal(
      rootEntry: rootEntry,
      entryCollectionSnapshots: ReplaySubject()
        ..add([
          EntrySnapshot(rootEntry, isPending: false),
          ...(entryCollectionSnapshots ?? [])
        ]),
      headEntryRefs: headEntryRefs ?? {},
      mainRefSnapshots: ReplaySubject()..add(mainEntryRef ?? rootEntry.ref),
    );
  }

  InMemoryDataStoreInternal({
    required ReplaySubject<Iterable<EntrySnapshot<Event>>>
        entryCollectionSnapshots,
    required ReplaySubject<EntryRef> mainRefSnapshots,
    required Entry<Event> rootEntry,
    required Map<String, HeadEntryRef> headEntryRefs,
  })  : _entryCollectionSnapshots = entryCollectionSnapshots,
        _mainRefSnapshots = mainRefSnapshots,
        _headEntryRefs = headEntryRefs,
        _rootEntry = rootEntry;

  void addEntrySnapshots(Iterable<EntrySnapshot<Event>> snapshots) {
    _entryCollectionSnapshots.add(snapshots);
  }

  void setMainEntryRef(EntryRef entryRef) {
    _mainRefSnapshots.add(entryRef);
  }

  Future<void> appendHeadEntry(
    Entry<Event> entry,
    HeadEntryRef headEntryRef, {
    required String headRefId,
  }) async {
    final snapshot = EntrySnapshot(entry, isPending: true);
    _entryCollectionSnapshots.add([snapshot]);
    _entryCollectionSnapshots.add([snapshot.copyWith(isPending: false)]);
    _headEntryRefs[headRefId] = headEntryRef;
  }

  Future<void> forwardHeadEntryRef(
    EntryRef previous,
    HeadEntryRef next, {
    required String headRefId,
  }) async {
    _headEntryRefs[headRefId] = next;
  }

  Future<void> resetHeadEntryRef(
    EntryRef previous,
    HeadEntryRef next, {
    required String headRefId,
  }) async {
    _headEntryRefs[headRefId] = next;
  }

  Future<void> updateMainEntryRef(EntryRef previous, EntryRef next) async {
    _mainRefSnapshots.add(next);
  }

  Stream<Iterable<EntrySnapshot<Event>>> get entrySnapshotsStream =>
      _entryCollectionSnapshots.asBroadcastStream();

  Map<String, HeadEntryRef> get headEntryRefs => _headEntryRefs;

  Future<EntryRef> get mainEntryRef async => _mainRefSnapshots.values.last;

  Future<EntryRef?> get mainEntryRefMaybe async =>
      _mainRefSnapshots.values.lastOrNull;

  Stream<EntryRef> get mainEntryRefStream => _mainRefSnapshots.stream;

  Future<Entry<Event>> get rootEntry async => _rootEntry;
}
