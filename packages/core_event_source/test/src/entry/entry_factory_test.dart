import 'package:core_event_source/entry.dart';
import 'package:test/test.dart';

main() {
  group('standard factory', () {
    test('createdAt is now', () {
      final entry = EntryFactory.standard().create(refs: [], events: []);
      expect(DateTime.now().difference(entry.createdAt).inMilliseconds,
          lessThan(1));
    });
    test('refs are unique', () {
      final factory = EntryFactory.standard();
      final entry1 = factory.create(refs: [], events: []);
      final entry2 = factory.create(refs: [], events: []);
      expect(entry1.ref == entry2.ref, false);
      expect(entry1.ref, isNot(entry2.ref));
    });
  });
}
