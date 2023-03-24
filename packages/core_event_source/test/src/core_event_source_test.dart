// ignore_for_file: prefer_const_constructors

import 'package:test/test.dart';
import 'package:core_event_source/core_event_source.dart';

void main() {
  group('CoreEventSource', () {
    test('can be instantiated', () {
      expect(CoreEventSource(), isNotNull);
    });
  });
}
