@Timeout(const Duration(seconds: 1))
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
        final sources = await Future.wait([
          buildTestEventSourceInstance(
              headRefId: '1', dataStoreInternal: dataStoreInternal),
          buildTestEventSourceInstance(
              headRefId: '2', dataStoreInternal: dataStoreInternal),
        ]);
        source1 = sources.first;
        source2 = sources.last;
      });
      test(
        'execute commands on separate source instances, in sequence',
        () async {
          expect(source1.stream, emitsInOrder([2, 4]));
          expect(source2.stream, emitsInOrder([2, 4]));
          source2.execute([{}]);
          source1.execute([{}]);
        },
      );
    },
  );
}
