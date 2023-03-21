// @Timeout(const Duration(seconds: 1))
import 'package:core_event_source/event_source.dart';
import 'package:core_event_source/internal.dart';
import 'package:test/test.dart';

import '../test_doubles/fake_behavior.dart';
import '_test_util.dart';

main() {
  // DebugBlocObserver.observe();
  late EventSource<FakeCommand, FakeView> source1;
  late EventSource<FakeCommand, FakeView> source2;
  late InMemoryDataStoreInternal<FakeEvent> dataStoreInternal;
  group(
    'description',
    () {
      setUp(() async {
        dataStoreInternal = InMemoryDataStoreInternal.from();
        source1 = await buildTestEventSourceInstance(
            headRefId: '1', dataStoreInternal: dataStoreInternal);
        source2 = await buildTestEventSourceInstance(
            headRefId: '2', dataStoreInternal: dataStoreInternal);
      });
      test(
        'execute commands on separate source instances, in sequence',
        () async {
          source1.execute([{}]);
          expect(source2.stream, emitsInOrder([1, 2]));
        },
      );
    },
  );
}
