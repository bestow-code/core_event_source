import 'package:core_event_source/event_source.dart';
import 'package:core_event_source_test_util/core_event_source_test_util.dart';

main() async => MergeTestGroup(
      InMemoryTestEventStoreFactory(),
    ).run();
