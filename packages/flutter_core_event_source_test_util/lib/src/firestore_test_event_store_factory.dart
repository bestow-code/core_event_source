import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core_event_source/event_source.dart';
import 'package:core_event_source_test_util/core_event_source_test_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_core_event_source/flutter_core_event_source.dart';
import 'package:flutter_test/flutter_test.dart';

class FirestoreTestEventStoreFactory extends TestEventStoreFactory {
  static const kEmulatorHost = '127.0.0.1';
  static const kAuthEmulatorPort = 9099;
  static const kFirestoreEmulatorPort = 8080;

  final Future<FirebaseApp> Function() app;

  FirestoreTestEventStoreFactory(
    this.app,
  );

  @override
  Future<EventStore> create() async {
    final auth = FirebaseAuth.instanceFor(app: await app());
    await auth.useAuthEmulator(kEmulatorHost, kAuthEmulatorPort);
    final userNumber = Random().nextInt(1000);
    final email = 'test.user-$userNumber@bestow.world';
    const password = 'abc123!';

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code != 'email-already-in-use') {
        rethrow;
      }
    }
    await auth.signInWithEmailAndPassword(email: email, password: password);

    final firestore = FirebaseFirestore.instance;
    firestore.useFirestoreEmulator('127.0.0.1', 8080);
    return FirestoreEventStore.instanceFor(firestore: firestore);
  }
}
