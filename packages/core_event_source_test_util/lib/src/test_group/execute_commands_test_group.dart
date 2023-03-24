@Timeout(const Duration(milliseconds: 1000))
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

      blocTest(
        'execute command',
        build: () => source1,
        act: (_) async {
          source1.start();
          await source1.isReady;
          source1.execute([FakeCommand()]);
        },
        wait: const Duration(milliseconds: 10),
        expect: () => [FakeView(2)],
      );
      blocTest(
        'execute two command, same execution',
        build: () => source1,
        act: (_) async {
          source1.start();
          await source1.isReady;
          source1.execute([FakeCommand(), FakeCommand()]);
        },
        wait: const Duration(milliseconds: 10),
        expect: () => [FakeView(4)],
      );
      blocTest(
        'execute two command, same instance',
        build: () => source1,
        act: (_) async {
          source1.start();
          await source1.isReady;
          source1.execute([FakeCommand()]);
          source1.execute([FakeCommand()]);
        },
        wait: const Duration(milliseconds: 10),
        expect: () => [FakeView(2), FakeView(4)],
        // expect: () => [1, FakeView(2, FakeView(4)],
      );
      blocTest(
        'execute commands on separate source instances, in sequence',
        setUp: () async {
          source1.start();
          await source1.isReady;
          final done = source1.stream.take(1).first;
          source1.execute([FakeCommand()]);
          await done;
          await source1.close();
          source1 = await build(eventStore, sourcePath, headRefName1);
        },
        build: () => source1,
        act: (_) async {
          source1.start();
          await source1.isReady;
          source1.execute([FakeCommand()]);
          source1.execute([FakeCommand()]);
        },
        wait: const Duration(milliseconds: 10),
        expect: () => [FakeView(2), FakeView(4), FakeView(8)],
        tearDown: () async => await source1.close(),
      );
    });
  }
}
