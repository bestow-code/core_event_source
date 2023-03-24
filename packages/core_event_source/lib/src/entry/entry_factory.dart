import '../../../entry.dart';

class EntryFactory<Event> {
  final EntryRefFactory entryRefFactory;
  final DateTimeFactory dateTimeFactory;

  factory EntryFactory.standard() => EntryFactory.randomRefCreatedNow();

  factory EntryFactory.randomRefCreatedNow() => EntryFactory(
        entryRefFactory: EntryRefFactory.basic(),
        dateTimeFactory: DateTimeFactory.now(),
      );

  factory EntryFactory.increment([int? start]) {
    return EntryFactory(
        entryRefFactory: EntryRefFactory.increment(start ?? 0),
        dateTimeFactory: DateTimeFactory.increment(start ?? 0));
  }

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

  factory DateTimeFactory.increment([int? start]) {
    var _start = start ?? 0;
    return DateTimeFactory(() {
      _start = _start + 1;
      return DateTime.fromMillisecondsSinceEpoch(_start);
    });
  }

  DateTimeFactory(this._create);

  DateTime create() => _create();
}
