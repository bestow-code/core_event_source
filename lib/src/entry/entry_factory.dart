import '../../../entry.dart';

class EntryFactory<Event> {
  final EntryRefFactory entryRefFactory;
  final DateTimeFactory dateTimeFactory;

  factory EntryFactory.standard() => EntryFactory.randomRefCreatedNow();

  factory EntryFactory.randomRefCreatedNow() => EntryFactory(
        entryRefFactory: EntryRefFactory.basic(),
        dateTimeFactory: DateTimeFactory.now(),
      );

  factory EntryFactory.increment([int start = 0]) => EntryFactory(
      entryRefFactory: EntryRefFactory.increment(start),
      dateTimeFactory: DateTimeFactory.increment(start));

  EntryFactory({
    required this.entryRefFactory,
    required this.dateTimeFactory,
  });

  Entry<Event> create({
    required Iterable<EntryRef> refs,
    required Iterable<Event> events,
    EntryRef? ref,
  }) =>
      Entry<Event>(
          ref: ref ?? entryRefFactory.create(),
          refs: refs,
          events: events,
          createdAt: dateTimeFactory.create());
}

class DateTimeFactory {
  final DateTime Function() _create;

  factory DateTimeFactory.now() => DateTimeFactory(DateTime.now);

  factory DateTimeFactory.increment([int start = 0]) {
    return DateTimeFactory(() {
      start = start + 1;
      return DateTime.fromMillisecondsSinceEpoch(start);
    });
  }

  DateTimeFactory(this._create);

  DateTime create() => _create();
}
