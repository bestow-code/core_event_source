import 'package:core_event_source/entry.dart';
import 'package:core_event_source/internal.dart';
import 'package:rxdart/rxdart.dart';


class DataAdapterFirestore<Event> extends DataAdapter<Event> {
  final FirestoreEntryStore<Event> dataStore;

  DataAdapterFirestore(this.dataStore);

  @override
  Stream<Iterable<EntrySnapshot<Event>>> get entrySnapshotsStream =>
      dataStore.entryQuerySnapshots.map((querySnapshot) => querySnapshot.docs
          .map((documentSnapshot) => EntrySnapshot<Event>(
              documentSnapshot.data(),
              isPending: documentSnapshot.metadata.hasPendingWrites)));

  @override
  Future<EntryRef?> get headEntryRef async => (await dataStore.headEntryRef);

  @override
  Future<Entry<Event>> get rootEntry async => (await dataStore.initialEntry)!;

  @override
  Future<void> initialize(Entry<Event> initialEntryIfEmpty) =>
      dataStore.initialize(initialEntryIfEmpty);

  @override
  Future<EntryRef> get mainEntryRef async => (await dataStore.mainEntryRef)!;

  @override
  Stream<EntryRef> get mainEntryRefStream =>
      dataStore.mainEntryRefSnapshotStream
          .map((snapshot) => snapshot.data())
          .whereNotNull();

  @override
  Future<void> appendHeadEntry(Entry<Event> entry) =>
      dataStore.updateHeadEntry(entry);

  @override
  Future<void> forwardHeadEntryRef(EntryRef previous, EntryRef next) =>
      dataStore.forwardHeadEntryRef(previous, next);

  @override
  Future<void> updateMainEntryRef(EntryRef previous, EntryRef next) =>
      dataStore.updateMainEntryRef(previous, next);

  @override
  Future<void> resetHeadEntryRef(EntryRef previous, EntryRef next) =>
      dataStore.resetHeadEntryRef(previous, next);
}
