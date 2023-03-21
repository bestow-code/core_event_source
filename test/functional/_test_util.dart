import 'package:core_event_source/event_source.dart';
import 'package:core_event_source/internal.dart';

import '../test_doubles/fake_behavior.dart';

Future<EventSource<FakeCommand, FakeView>> buildTestEventSourceInstance({
  required InMemoryDataStoreInternal<FakeEvent> dataStoreInternal,
  required String headRefId,
}) async {
  return await EventSourceImpl.from<FakeCommand, FakeEvent, FakeState,
          FakeView>(
      dataStore: InMemoryDataStore(
        headRefId: headRefId,
        dataStoreInternal: dataStoreInternal,
      ),
      behavior: FakeBehavior());
}
