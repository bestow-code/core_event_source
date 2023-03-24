import 'dart:async';

import 'package:core_event_source/event_source.dart';

import '../core_event_source_test_util.dart';

typedef EventStoreBuilder = Future<EventStore> Function();

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
