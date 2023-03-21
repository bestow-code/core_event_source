import 'package:core_event_source/event_source.dart';
import 'package:core_event_source/internal.dart';
import 'package:core_event_source/src/event_sourced_behavior/event_sourced_behavior.dart';

class EventStoreImpl implements EventStore {
  // final Map<Type,Map<String,InMemoryDataStore>> _dataStores;
  final String _appId;
  // static final Map<String, EventStore> _cachedInstances = {};

  String get appId => _appId;

  EventStoreImpl({String? appId}) : _appId = appId ?? '[DEFAULT]';

  @override
  SourceReference<Event> source<Event>(
      {required String path, required JsonEventConverter<Event> reader}) {
    return SourceReferenceImpl(path: path, eventJsonConverter: reader);
  }
}

class SourceReferenceImpl<Event> extends SourceReference<Event> {
  @override
  HeadReference<Event> head(String headRefName) =>
      HeadReferenceImpl(headRefName: headRefName, sourceReference: this);

  @override
  final String path;

  SourceReferenceImpl(
      {required this.path,
      required JsonEventConverter<Event> eventJsonConverter});
}

class HeadReferenceImpl<Event> extends HeadReference<Event> {
  final String headRefName;

  final SourceReference<Event> sourceReference;

  HeadReferenceImpl({
    required this.headRefName,
    required this.sourceReference,
  });

  @override
  Future<EventSource<Command, View>> get<Command, State, View>(
      {required EventSourcedBehavior<Command, Event, State, View>
          behavior}) async {
    final internal = InMemoryDataStoreInternal.from();
    final dataStore = InMemoryDataStore(
        headRefName: headRefName, dataStoreInternal: internal);
    return EventSourceImpl.from(dataStore: dataStore, behavior: behavior);
  }
}
