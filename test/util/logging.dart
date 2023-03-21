import 'package:logging/logging.dart';

initializeDebugLogging() {
  Logger.root.level = Level.INFO;
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
