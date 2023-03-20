import 'package:core_event_source/event_source.dart';

import '../../../internal.dart';

// class EventStoreImpl implements EventStore {
//   // final Map<Type,Map<String,InMemoryDataStore>> _dataStores;
//   final String appId;
//   static final Map<String, EventStore> _cachedInstances = {};
//
//   EventStoreImpl({String? appId}) : _dataStore = dataStore;
//
//   @override
//   SourceReference<Event> source<Event>(
//       {required String path, required JsonEventConverter<Event> reader}) {
//     DataStore<Event> dataStore = _dataStores[Event]![path]!;
//     return SourceReferenceImpl(path: path, eventJsonConverter: reader);
//   }
// }
