@Timeout(Duration(seconds: 45))
import 'package:flutter_test/flutter_test.dart';

import '../test/integration_test_suite.dart';

main() => IntegrationTestSuite().all();
