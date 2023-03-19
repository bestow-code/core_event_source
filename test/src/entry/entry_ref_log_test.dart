import 'package:core_event_source/entry.dart';
import 'package:test/test.dart';

main() {
  test('toJson', () {
    final entryRefFactory = EntryRefFactory.increment();
    final previousRef = entryRefFactory.create();
    final nextRef = entryRefFactory.create();
    final createdAt = DateTimeFactory.increment().create();
    final log = EntryRefLog.apply(
        previousRef: previousRef, nextRef: nextRef, createdAt: createdAt);
    expect(EntryRefLog.fromJson(log.toJson()), equals(log));
  });
}
