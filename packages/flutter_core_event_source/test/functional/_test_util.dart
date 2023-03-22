import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core_event_source/event_source.dart';
import 'package:flutter_core_event_source/flutter_core_event_source.dart';

import '../test_doubles/fake_behavior.dart';

Future<EventSource<FakeCommand, FakeView>> buildTestEventSourceInstance({
  required EventStore eventStore,
  required String headRefId,
}) async {
  return await eventStore
      .source(path: 'test/1', reader: FakeEventJsonConverter())
      .head(headRefId)
      .get<FakeCommand, FakeState, FakeView>(
        behavior: FakeBehavior(),
      );
}
