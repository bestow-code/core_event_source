import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core_event_source/event_source.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../internal.dart';

/// The entry point for accessing an [EventStore]
abstract class EventStore {
  static final Map<String, EventStore> _cachedInstances = {};

  /// Returns an [EventStore] instance using the default [FirebaseApp].
  static EventStore get instance {
    return EventStore.instanceFor(
      firestore: FirebaseFirestore.instance,
    );
  }

  /// Returns an [EventStore] instance using a specified [FirebaseApp].
  static EventStore instanceFor({required FirebaseFirestore firestore}) {
    if (_cachedInstances.containsKey(firestore.app.name)) {
      return _cachedInstances[firestore.app.name]!;
    }

    EventStore newInstance = EventStoreImpl(firestore: firestore);
    _cachedInstances[firestore.app.name] = newInstance;

    return newInstance;
  }

  SourceReference<Event> source<Event>({
    required String path,
    required JsonEventConverter<Event> reader,
  });
}
