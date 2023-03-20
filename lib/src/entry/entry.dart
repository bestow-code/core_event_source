import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entry.dart';
import '../../common.dart';

part 'entry.freezed.dart';

part 'entry.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class Entry<Event> with _$Entry<Event>, Comparable<Entry<Event>> {
  const Entry._();

  factory Entry.epoch() =>
      Entry.newRoot(createdAt: DateTime.fromMillisecondsSinceEpoch(0));

  factory Entry.newRoot({DateTime? createdAt}) => Entry(
      ref: EntryRef.root,
      refs: const Iterable.empty(),
      events: const Iterable.empty(),
      createdAt: createdAt ?? DateTime.now());

  factory Entry({
    required EntryRef ref,
    required Iterable<EntryRef> refs,
    required Iterable<Event> events,
    @DateTimeConverter() required DateTime createdAt,
  }) = _Entry;

  factory Entry.fromJson(
    Map<String, dynamic> json,
    Event Function(Object? json) fromJsonEvent,
  ) {
    return _$EntryFromJson<Event>(json, fromJsonEvent);
  }

  Map<String, dynamic> toJson(Object? Function(Event) eventToJson) =>
      _$EntryToJson<Event>(this, eventToJson)
      // ..['ref']
      // ..update('ref', (_) => ref.toJson())
      // ..update('events', (_) => events.map(eventToJson).toList())
      // ..update('refs', (_) => refs.map((o) => o.toJson()).toList())
      // ..update('createdAt', (_) => DateTimeConverter().toJson(createdAt),
      // )
      ;

  @override
  int compareTo(Entry<Event> other) {
    final r = createdAt.compareTo(other.createdAt);
    if (r != 0) return r;
    return ref.value.compareTo(other.ref.value);
  }
}
