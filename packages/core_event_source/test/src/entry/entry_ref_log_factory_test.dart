import 'package:core_event_source/entry.dart';
import 'package:test/test.dart';

main() {
  final entryRefFactory = EntryRefFactory.increment();
  final previous = entryRefFactory.create();
  final next = entryRefFactory.create();
  test('create', () {
    final referenceDateTimeFactory = DateTimeFactory.increment();
    final entryRefLogFactory = EntryRefLogFactory(DateTimeFactory.increment());
    expect(
        EntryRefLog.fromJson(
            entryRefLogFactory.apply(previous: previous, next: next).toJson()),
        EntryRefLog.apply(
            previousRef: previous,
            nextRef: next,
            createdAt: referenceDateTimeFactory.create()));
    expect(
        EntryRefLog.fromJson(entryRefLogFactory
            .forward(previous: previous, next: next)
            .toJson()),
        EntryRefLog.forward(
            previousRef: previous,
            nextRef: next,
            createdAt: referenceDateTimeFactory.create()));
    expect(
        EntryRefLog.fromJson(
            entryRefLogFactory.reset(previous: previous, next: next).toJson()),
        EntryRefLog.reset(
            previousRef: previous,
            nextRef: next,
            createdAt: referenceDateTimeFactory.create()));
  });
}
