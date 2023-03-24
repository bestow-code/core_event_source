import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_core_event_source/flutter_core_event_source.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('instanceFor returns EventStore by firebase appId', () async {
    await Firebase.initializeApp();
    final eventStore1 = FirestoreEventStore.instance;
    final eventStore2 =
        FirestoreEventStore.instanceFor(firestore: FirebaseFirestore.instance);
    expect(eventStore1, eventStore2);
  });
}
