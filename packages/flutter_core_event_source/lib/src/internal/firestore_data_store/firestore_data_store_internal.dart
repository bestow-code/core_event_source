import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core_event_source/entry.dart';

abstract class FirestoreDataStoreInternal<Event> {
  Stream<QuerySnapshot<Entry<Event>>> get entryQuerySnapshots;

  Stream<DocumentSnapshot<EntryRef>> get mainEntryRefSnapshotStream;

  Future<Entry<Event>?> get rootEntry;

  Future<EntryRef> get mainEntryRef;

  Future<HeadEntryRef?> get headEntryRef;

  Future<Iterable<EntryRefLog>> get entryRefLog;

  Future<void> initialize(Entry<Event> initialEntryIfEmpty);

  Future<void> updateHeadEntry(Entry<Event> entry, HeadEntryRef headEntryRef);

  Future<void> appendMergeEntry(Entry<Event> entry, HeadEntryRef headEntryRef);

  Future<void> updateMainEntryRef(EntryRef previous, EntryRef next);

  Future<void> forwardHeadEntryRef(EntryRef previous, HeadEntryRef next);

  Future<void> resetHeadEntryRef(EntryRef previous, HeadEntryRef next);
}
