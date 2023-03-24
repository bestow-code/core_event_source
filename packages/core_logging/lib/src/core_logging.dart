import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

class CoreLogging {
  static void setup({Level level = Level.ALL, Level stderrLevel = Level.OFF}) {
    PrintAppender.setupLogging(level: level, stderrLevel: stderrLevel);
  }
}
