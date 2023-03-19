import 'package:core_event_source/event_source.dart';
import 'package:core_event_source/event_sourced_behavior.dart';
import 'package:core_event_source/internal.dart';

class HeadReferenceImpl<Event> extends HeadReference<Event> {
  @override
  final SourceReferenceImpl<Event> sourceReference;

  @override
  final String headRef;

  HeadReferenceImpl(
    this.headRef,
    this.sourceReference,
  );

  @override
  Future<EventSource<Command, View>> start<Command, State, View>(
          EventSourcedBehavior<Command, Event, State, View> behavior) async =>
      await get(behavior: behavior);

  @override
  Future<EventSource<Command, View>> get<Command, State, View>({
    required EventSourcedBehavior<Command, Event, State, View> behavior,
  }) async {
    final entryStore = FirestoreEntryStoreImpl.from(sourceReference.firestore,
        sourceReference.path, headRef, sourceReference.eventJsonConverter);
    final adapter = DataAdapterFirestore(entryStore);
    return EventSourceImpl.from(adapter: adapter, behavior: behavior);
  }
}
