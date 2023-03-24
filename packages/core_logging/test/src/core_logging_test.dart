// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:core_logging/core_logging.dart';

void main() {
  group('CoreLogging', () {
    test('can be instantiated', () {
      expect(CoreLogging(), isNotNull);
    });
  });
}
