import 'package:bloc_test/bloc_test.dart';
import 'package:core_event_source/event_source.dart';
import '../test_doubles/fake_behavior.dart';
import '../util/debug_bloc_observer.dart';
import '../util/fake_firebase_firestore.dart';
import '_test_util.dart';

main() {
  late EventSource<FakeCommand, FakeView> source1;
  late FakeFirebaseFirestore firestore;
  DebugBlocObserver.observe();
  blocTest(
    'execute command',
    setUp: () async {
      firestore = FakeFirebaseFirestore.newInstance;
      source1 = await buildTestEventSourceInstance(
          headRefId: '1', firestore: firestore);
    },
    build: () => source1,
    act: (_) {
      source1.execute([{}]);
    },
    expect: () => [2],
  );
  blocTest(
    'execute two command, same execution',
    setUp: () async {
      firestore = FakeFirebaseFirestore.newInstance;
      source1 = await buildTestEventSourceInstance(
          headRefId: '1', firestore: firestore);
    },
    build: () => source1,
    act: (_) {
      source1.execute([{}, {}]);
    },
    expect: () => [4],
  );
  blocTest(
    'execute two command, same instance',
    setUp: () async {
      firestore = FakeFirebaseFirestore.newInstance;
      source1 = await buildTestEventSourceInstance(
          headRefId: '1', firestore: firestore);
    },
    build: () => source1,
    act: (_) {
      source1.execute([{}]);
      source1.execute([{}]);
    },
    expect: () => [2, 4],
  );
  blocTest(
    'execute commands on separate source instances, in sequence',
    setUp: () async {
      firestore = FakeFirebaseFirestore.newInstance;

      source1 = await buildTestEventSourceInstance(
          headRefId: '1', firestore: firestore);

      final done = source1.stream.first.then((value) async {
        source1 = await buildTestEventSourceInstance(
            headRefId: '1', firestore: firestore);
        await source1.stream.first;
      });
      source1.execute([{}]);
      await done;
    },
    build: () => source1,
    act: (_) {
      source1.execute([{}]);
    },
    expect: () => [4],
  );
}
