import 'package:flutter_core_event_source_test_util/flutter_core_event_source_test_util.dart';
import 'package:integration_test/integration_test.dart';

import '../test/functional/execute_commands_test.dart' as execute_commands_test;
import '../test/functional/forward_and_follow_test.dart'
    as forward_and_follow_test;

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  initializeDebugLogging();
  final mains = [
    execute_commands_test.main,
    forward_and_follow_test.main,
  ];
  for (final main in mains) {
    main();
  }
}
