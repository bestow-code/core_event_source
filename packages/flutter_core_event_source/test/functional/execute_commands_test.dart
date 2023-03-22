import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core_event_source/event_source.dart';
import 'package:diff_match_patch/diff_match_patch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_core_event_source/flutter_core_event_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

// import '../util/debug_bloc_observer.dart';
import 'package:test/test.dart' as test;

import '../test_doubles/fake_behavior.dart';

part 'bloc_test.dart';

main() async {
  ExecuteCommandsTestGroup(FirestoreEventStoreFactory(
      () async => await Firebase.initializeApp())).run();
}

typedef EventStoreBuilder = Future<EventStore> Function();

class ExecuteCommandsTestGroup extends IntegrationTestGroup {
  ExecuteCommandsTestGroup(super.eventStoreFactory);

  static const headRefName1 = '1';
  static const headRefName2 = '2';

  @override
  run() {
    late EventStore eventStore;
    late String sourcePath;
    late EventSource<FakeCommand, FakeView> source1;

    group('Execute Commands', () {
      setUp(() async => eventStore = await eventStoreFactory.create());
      setUp(() => sourcePath = 'objects/${Random.secure().nextDouble()}');
      setUp(() async =>
          source1 = await build(eventStore, sourcePath, headRefName1));

      blocTest2(
        'execute command',
        build: () => source1,
        act: (_) async {
          await source1.isReady;
          source1.execute([{}]);
        },
        wait: const Duration(milliseconds: 10),
        expect: () => [1, 2],
      );
      blocTest2(
        'execute two command, same execution',
        build: () => source1,
        act: (_) async {
          await source1.isReady;
          source1.execute([{}, {}]);
        },
        wait: const Duration(milliseconds: 10),
        expect: () => [1, 4],
      );
      blocTest2(
        'execute two command, same instance',
        build: () => source1,
        act: (_) async {
          await source1.isReady;
          source1.execute([{}]);
          source1.execute([{}]);
        },
        wait: const Duration(milliseconds: 10),
        expect: () => [1, 2, 4],
      );
      blocTest2(
        'execute commands on separate source instances, in sequence',
        setUp: () async {
          await source1.isReady;
          final done = source1.stream.take(1).first;
          source1.execute([{}]);
          await done;
          await source1.close();
          source1 = await build(eventStore, sourcePath, headRefName1);
        },
        build: () => source1,
        act: (_) async {
          await source1.isReady;
          source1.execute([{}]);
          source1.execute([{}]);
        },
        wait: const Duration(milliseconds: 10),
        expect: () => [1, 2, 4, 8],
        tearDown: () async => await source1.close(),
      );
    });
  }
}

abstract class IntegrationTestGroup {
  final TestEventStoreFactory eventStoreFactory;

  IntegrationTestGroup(this.eventStoreFactory);

  Future<EventSource<FakeCommand, FakeView>> build(
          EventStore eventStore, String sourcePath, String headRefName) async =>
      (eventStore)
          .source(path: (sourcePath), reader: FakeEventJsonConverter())
          .head(headRefName)
          .get<FakeCommand, FakeState, FakeView>(
            behavior: FakeBehavior(),
          );

  void run();
}

abstract class TestEventStoreFactory {
  Future<EventStore> create();
}

class FirestoreEventStoreFactory extends TestEventStoreFactory {
  static const kEmulatorHost = '127.0.0.1';
  static const kAuthEmulatorPort = 9099;
  static const kFirestoreEmulatorPort = 8080;

  final Future<FirebaseApp> Function() app;

  FirestoreEventStoreFactory(
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
