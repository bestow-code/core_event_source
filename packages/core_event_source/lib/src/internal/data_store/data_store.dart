import '../../../entry.dart';
import '../../../internal.dart';

abstract class CoreDataStore<Event>
    with DataStoreRead<Event>, DataStoreWrite<Event> {
  const CoreDataStore._();
}

abstract class DataStoreRead<Event> {
  /// The current [EntryRef] from the headRef.
  // Future<EntryRef?> get headEntryRefMaybe;
  Future<HeadEntryRef?> get headEntryRef;

  /// The current [EntryRef] from the mainRef.
  Future<EntryRef> get mainEntryRef;

  /// The initial entry
  Future<Entry<Event>> get rootEntry;

  /// Stream of updates to the main [EntryRef]
  Stream<EntryRef> get mainEntryRefStream;

  /// Stream of additions and metadata changes for the [Entry] collection
  Stream<Iterable<EntrySnapshot<Event>>> get entrySnapshotsStream;
}

abstract class DataStoreWrite<Event> {
  /// Transactional creation of initial entry and main entry ref.
  Future<void> initialize(Entry<Event> rootEntryIfEmpty);

  /// Execute a batch-write of the given [Entry], an [EntryRef], and an [EntryRefLog]
  Future<void> appendHeadEntry(Entry<Event> entry, HeadEntryRef headEntryRef);

  Future<void> appendMergeEntry(Entry<Event> entry, HeadEntryRef headEntryRef);

  /// Execute a batch-write of an [EntryRef], and a corresponding [EntryRefLog]
  Future<void> forwardHeadEntryRef(EntryRef previous, HeadEntryRef next);

  /// Execute a batch-write of an [EntryRef], and a corresponding [EntryRefLog]
  Future<void> resetHeadEntryRef(EntryRef previous, HeadEntryRef next);

  /// Executes a transactional update of the main [EntryRef] document
  ///
  /// Throws if the current [EntryRef] is not equal to [previous].
  Future<void> updateMainEntryRef(EntryRef previous, EntryRef next);
}
