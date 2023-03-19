import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:core_event_source/entry.dart';
import 'package:core_event_source/event_source.dart';

import '../../../internal.dart';

typedef HasContention = bool Function(DocumentSnapshot<EntryRef>);

class FirestoreEntryStoreImpl<Event> implements FirestoreEntryStore<Event> {
  static HasContention hasContention =
      (documentSnapshot) => documentSnapshot.exists;
  final CollectionReference<Entry<Event>> _entryCollectionReference;
  final CollectionReference<EntryRefLog> _entryRefLogCollectionReference;
  final CollectionReference<EntryRef> _headRefCollectionReference;
  final DocumentReference<EntryRef> _mainRefDocumentReference;
  final HasContention _hasContention;
  final IdFactory _idFactory;
  final EntryRefLogFactory _entryRefLogFactory;

  factory FirestoreEntryStoreImpl.from(
    FirebaseFirestore firestore,
    String path,
    String headRef,
    JsonEventConverter<Event> eventConverter, {
    HasContention? hasContention,
    IdFactory? idFactory,
    EntryRefLogFactory? entryRefLogFactory,
  }) {
    final entryCollectionReference = firestore
        .doc(path)
        .collection('objects')
        .withConverter<Entry<Event>>(
            fromFirestore: (doc, options) => Entry.fromJson(
                doc.data()!,
                (json) => eventConverter
                    .fromJsonObject(json as Map<String, dynamic>)),
            toFirestore: (data, options) =>
                data.toJson(eventConverter.toJsonObject));
    final headRefCollectionReference = firestore
        .doc(path)
        .collection('heads')
        .doc(headRef)
        .collection('refs')
        .withConverter(
            fromFirestore: (doc, options) => EntryRef.fromJson(doc.data()!),
            toFirestore: (data, options) => data.toJson());
    final mainRefDocumentReference = firestore.doc(path).withConverter(
        fromFirestore: (doc, options) => EntryRef.fromJson(doc.data()!),
        toFirestore: (data, options) => data.toJson());
    final entryRefLogCollectionReference = firestore
        .doc(path)
        .collection('heads')
        .doc(headRef)
        .collection('refLog')
        .withConverter(
            fromFirestore: (doc, options) => EntryRefLog.fromJson(doc.data()!),
            toFirestore: (data, options) => data.toJson());
    return FirestoreEntryStoreImpl(
      entryCollectionReference: entryCollectionReference,
      headRefCollectionReference: headRefCollectionReference,
      mainRefDocumentReference: mainRefDocumentReference,
      entryRefLogCollectionReference: entryRefLogCollectionReference,
      hasContention: hasContention,
      idFactory: idFactory,
      entryRefLogFactory: entryRefLogFactory,
    );
  }

  FirestoreEntryStoreImpl({
    required CollectionReference<Entry<Event>> entryCollectionReference,
    required CollectionReference<EntryRef> headRefCollectionReference,
    required DocumentReference<EntryRef> mainRefDocumentReference,
    required CollectionReference<EntryRefLog> entryRefLogCollectionReference,
    HasContention? hasContention,
    IdFactory? idFactory,
    EntryRefLogFactory? entryRefLogFactory,
  })  : _mainRefDocumentReference = mainRefDocumentReference,
        _headRefCollectionReference = headRefCollectionReference,
        _entryCollectionReference = entryCollectionReference,
        _entryRefLogCollectionReference = entryRefLogCollectionReference,
        _hasContention = hasContention ?? FirestoreEntryStoreImpl.hasContention,
        _idFactory = idFactory ?? IdFactory.random(),
        _entryRefLogFactory =
            entryRefLogFactory ?? EntryRefLogFactory(DateTimeFactory.now());

  @override
  Stream<QuerySnapshot<Entry<Event>>> get entryQuerySnapshots =>
      _entryCollectionReference.snapshots(includeMetadataChanges: true);

  @override
  Future<EntryRef?> get headEntryRef => _headRefCollectionReference
      .orderBy('createdAt', descending: true)
      .limit(1)
      .get()
      .then((value) => value.docs.firstOrNull?.data());

  @override
  Future<Entry<Event>> get initialEntry async =>
      (await _entryCollectionReference.doc(EntryRef.root.value).get()).data()!;

  @override
  Future<void> initialize(Entry<Event> initialEntryIfEmpty) async {
    assert(initialEntryIfEmpty.refs.isEmpty); // initial entry can't have parent
    assert(initialEntryIfEmpty
        .events.isEmpty); // initial entry events not supported atm
    final mainRefDoc = await _mainRefDocumentReference.get();
    if (mainRefDoc.exists) {
      return;
    }

    final initialEntry = initialEntryIfEmpty;
    await _entryCollectionReference.firestore
        .runTransaction((transaction) async {
      final mainRef = await transaction.get(_mainRefDocumentReference);
      if (_hasContention(mainRef)) {
        return false;
      } else {
        transaction.set(_entryCollectionReference.doc(initialEntry.ref.value),
            initialEntry);
        transaction.set(_mainRefDocumentReference, initialEntry.ref);
      }
    });
  }

  @override
  Future<EntryRef?> get mainEntryRef async =>
      (await _mainRefDocumentReference.get()).data();

  @override
  Stream<DocumentSnapshot<EntryRef>> get mainEntryRefSnapshotStream =>
      _mainRefDocumentReference.snapshots(includeMetadataChanges: true);

  @override
  Future<void> updateHeadEntry(Entry<Event> entry) async {
    final batch = _entryCollectionReference.firestore.batch();
    batch.set(_entryCollectionReference.doc(entry.ref.value), entry);
    batch.set(_headRefCollectionReference.doc(_idFactory.create()), entry.ref);
    batch.set(_entryRefLogCollectionReference.doc(_idFactory.create()),
        _entryRefLogFactory.apply(previous: entry.refs.first, next: entry.ref));
    await batch.commit();
  }

  @override
  Future<void> updateMainEntryRef(EntryRef target, EntryRef start) {
    throw UnimplementedError();
  }

  @override
  Future<void> forwardHeadEntryRef(EntryRef previous, EntryRef next) async {
    final batch = _headRefCollectionReference.firestore.batch();
    batch.set(_headRefCollectionReference.doc(_idFactory.create()), next);
    batch.set(_entryRefLogCollectionReference.doc(_idFactory.create()),
        _entryRefLogFactory.forward(previous: previous, next: next));
    await batch.commit();
  }

  @override
  Future<void> resetHeadEntryRef(EntryRef previous, EntryRef next) async {
    final batch = _headRefCollectionReference.firestore.batch();
    batch.set(_headRefCollectionReference.doc(_idFactory.create()), next);
    batch.set(_entryRefLogCollectionReference.doc(_idFactory.create()),
        _entryRefLogFactory.reset(previous: previous, next: next));
    await batch.commit();
  }

  @override
  Future<Iterable<EntryRefLog>> get entryRefLog async =>
      (await _entryRefLogCollectionReference.orderBy('createdAt').get())
          .docs
          .map((e) => e.data());
}
