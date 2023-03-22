import 'package:core_event_source/common.dart';

import '../../entry.dart';

class JsonEventConverter<Event> {
  final Event Function(Object?) fromJsonObject;
  final Map<String, dynamic> Function(Event) toJsonObject;

  JsonEventConverter(this.fromJsonObject, this.toJsonObject);
}

class JsonEntryConverter<Event> {
  final JsonEventConverter<Event> jsonEventConverter;

  JsonEntryConverter(this.jsonEventConverter);

  Entry<Event> Function(Object? json) get fromJsonObject => (json) =>
      Entry.fromJson(json as JsonObject, jsonEventConverter.fromJsonObject);

  Map<String, dynamic> Function(Entry<Event>) get toJsonObject =>
      (entry) => entry.toJson(jsonEventConverter.toJsonObject);
}
