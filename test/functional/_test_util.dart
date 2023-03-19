import 'package:core_event_source/event_source.dart';

import '../test_doubles/fake_behavior.dart';
import '../util/fake_firebase_firestore.dart';

Future<EventSource<FakeCommand, FakeView>> buildTestEventSourceInstance({
  required FakeFirebaseFirestore firestore,
  required String headRefId,
}) async {
  return await EventStore.instanceFor(firestore: firestore)
      .source(path: 'test/1', reader: FakeEventJsonConverter())
      .head(headRefId)
      .get<FakeCommand, FakeState, FakeView>(behavior: FakeBehavior());
}
