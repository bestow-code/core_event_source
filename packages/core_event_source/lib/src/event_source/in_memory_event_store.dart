import 'package:core_event_source/event_source.dart';
import 'package:core_event_source_test_util/core_event_source_test_util.dart';

import '../../event_sourced_behavior.dart';
import '../../internal.dart';

/// The entry point for accessing an [InMemoryEventStore]
abstract class InMemoryEventStore implements EventStore {
  static final Map<String, InMemoryEventStore> _cachedInstances = {};

  static var kDefaultStoreName = '[DEFAULT]';

  /// Returns an [InMemoryEventStore] instance using the default [FirebaseApp].
  static InMemoryEventStore get instance {
    return InMemoryEventStore.instanceFor(storeName: kDefaultStoreName);
  }

  /// Returns an [InMemoryEventStore] instance using a specified [FirebaseApp].
  static InMemoryEventStore instanceFor({required String storeName}) {
    if (_cachedInstances.containsKey(storeName)) {
      return _cachedInstances[storeName]!;
    }

    InMemoryEventStore newInstance = InMemoryEventStoreImpl();
    _cachedInstances[storeName] = newInstance;

    return newInstance;
  }

  @override
  SourceReference<Event> source<Event>({
    required String path,
    required JsonEventConverter<Event> reader,
  });
}

class InMemoryEventStoreImpl implements InMemoryEventStore {
  final Map<String, InMemorySourceReferenceImpl<dynamic>> _sourceReferences =
      {};

  InMemoryEventStoreImpl();
  @override
  SourceReference<Event> source<Event>(
          {required String path, required JsonEventConverter<Event> reader}) =>
      (_sourceReferences
            ..putIfAbsent(path,
                () => InMemorySourceReferenceImpl<Event>(path: path)))[path]
          as SourceReference<Event>;
}

class InMemorySourceReferenceImpl<Event> implements SourceReference<Event> {
  @override
  final String path;
  final InMemoryDataStoreInternal<Event> _dataStoreInternal =
      InMemoryDataStoreInternal.from();

  InMemorySourceReferenceImpl({
    required this.path,
  });

  @override
  HeadReference<Event> head(String headRefName) => InMemoryHeadReferenceImpl(
      headRefName: headRefName,
      sourceReference: this,
      dataStoreInternal: _dataStoreInternal);
}

class InMemoryHeadReferenceImpl<Event> extends HeadReference<Event> {
  @override
  final InMemorySourceReferenceImpl<Event> sourceReference;

  @override
  final String headRefName;

  final InMemoryDataStoreInternal<Event> _dataStoreInternal;

  InMemoryHeadReferenceImpl({
    required this.headRefName,
    required this.sourceReference,
    required InMemoryDataStoreInternal<Event> dataStoreInternal,
  }) : _dataStoreInternal = dataStoreInternal;

  @override
  Future<EventSource<Command, View>> get<Command, State, View>({
    required EventSourcedBehavior<Command, Event, State, View> behavior,
  }) async =>
      EventSourceImpl.from(
          dataStore: InMemoryDataStore<Event>(
              headRefName: headRefName, dataStoreInternal: _dataStoreInternal),
          behavior: behavior);
}

class InMemoryTestEventStoreFactory extends TestEventStoreFactory {
  @override
  Future<EventStore> create() async => InMemoryEventStoreImpl();
}
