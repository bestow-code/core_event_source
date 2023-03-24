import 'package:core_logging/core_logging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:logging/logging.dart';

import 'functional/execute_commands_test.dart' as execute_commands_test;
import 'functional/forward_and_follow_test.dart' as forward_and_follow_test;
import 'functional/merge_test.dart' as merge_test;
import 'src/event_source/firestore_event_store_test.dart'
    as firestore_event_store_test;

class IntegrationTestSuite {
  IntegrationTestSuite() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    CoreLogging.setup(level: Level.WARNING);
  }

  void all() {
    group('all', () {
      execute_commands_test.main();
      forward_and_follow_test.main();
      merge_test.main();
      firestore_event_store_test.main();
    });
  }
}
