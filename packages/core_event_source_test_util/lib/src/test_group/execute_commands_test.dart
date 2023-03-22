import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:core_event_source/event_source.dart';
import 'package:test/test.dart';

import '../../core_event_source_test_util.dart';

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
