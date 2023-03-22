import 'package:flutter_core_event_source_test_util/flutter_core_event_source_test_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'functional/execute_commands_test.dart' as execute_commands_test;
import 'functional/forward_and_follow_test.dart' as forward_and_follow_test;
import 'src/event_source/firestore_event_store_test.dart'
    as firestore_event_store_test;

class IntegrationTestSuite {
  IntegrationTestSuite() {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    initializeDebugLogging();
  }

  void all() {
    group('all', () {
      execute_commands_test.main();
      forward_and_follow_test.main();
      firestore_event_store_test.main();
    });
  }
}
