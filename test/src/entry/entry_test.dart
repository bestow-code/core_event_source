import 'package:core_event_source/common.dart';
import 'package:core_event_source/entry.dart';
import 'package:core_event_source/event_source.dart';
import 'package:test/test.dart';

typedef Event = JsonObject;

main() {
  test('toJson', () {
    final entryRefFactory = EntryRefFactory.increment();
    final dateTimeFactory = DateTimeFactory.increment();
    final entryFactory = EntryFactory<Event>(
      entryRefFactory: entryRefFactory,
      dateTimeFactory: dateTimeFactory,
    );
    final previousEntryRef = entryRefFactory.create();
    final events = [
      {"property": true}
    ];
    final entryRef = entryRefFactory.create();
    final entry = entryFactory
        .create(refs: [previousEntryRef], events: events, ref: entryRef);
    final eventConverter = JsonEventConverter<JsonObject>(
        (jsonObject) => jsonObject as JsonObject, (object) => object);
    final entryConverter = JsonEntryConverter(eventConverter);
    final json = entryConverter.toJsonObject(entry);
    final hydratedEntry = entryConverter.fromJsonObject(json);
    expect(hydratedEntry, entry);
  });
  test('sort - createdAt', () {
    final entryFactory = EntryFactory.standard();
    final entry1 = entryFactory.create(refs: [], events: []);
    final entry2 = entryFactory.create(refs: [], events: []);
    final entries = [entry2, entry1];
    expect(entries..sort(), [entry1, entry2]);
  });
  test('sort - ref', () {
    final entryFactory = EntryFactory.standard();
    final entry1 =
        entryFactory.create(ref: const EntryRef('a'), refs: [], events: []);
    final entry2 = entry1.copyWith(ref: const EntryRef('b'));
    final entries = [entry2, entry1];
    expect(entries..sort(), [entry1, entry2]);
  });
}
