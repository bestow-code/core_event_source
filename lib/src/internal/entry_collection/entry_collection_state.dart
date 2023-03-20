import 'package:collection/collection.dart';
import 'package:directed_graph/directed_graph.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entry.dart';
import '../../../internal.dart';

part 'entry_collection_state.freezed.dart';

@freezed
class EntryCollectionState<Event>
    with
        _$EntryCollectionState<Event>,
        EntrySnapshotsHandler<Event>,
        FollowMainEffectBuilder<Event> {
  const EntryCollectionState._();

  factory EntryCollectionState.initial({
    required Entry<Event> rootEntry,
    required EntryRef mainEntryRef,
  }) =>
      EntryCollectionState(
        mainEntryRef: mainEntryRef,
        entries: {rootEntry.ref: rootEntry},
        graph: DirectedGraph({rootEntry: {}}),
        pending: {},
      );

  factory EntryCollectionState({
    required EntryRef mainEntryRef,
    required Map<EntryRef, Entry<Event>> entries,
    required DirectedGraph<Entry<Event>> graph,
    required Set<EntryRef> pending,
  }) = _EntryCollectionState<Event>;
}

abstract class EntrySnapshotsHandler<Event>
    implements _$EntryCollectionState<Event> {
  EntryCollectionState<Event> add(Entry<Event> entry) =>
      _applySnapshots([EntrySnapshot(entry, isPending: true)]);

  EntryCollectionState<Event> applySnapshots(
          Iterable<EntrySnapshot<Event>> snapshots) =>
      _applySnapshots(snapshots);

  EntryCollectionState<Event> _applySnapshots(
      Iterable<EntrySnapshot<Event>> snapshots) {
    final nextEntries = Map.of(entries);
    for (final snapshot in snapshots) {
      nextEntries[snapshot.entry.ref] ??= snapshot.entry;
    }
    final nextGraphData = Map.of(graph.data);
    for (final snapshot in snapshots) {
      nextGraphData[snapshot.entry] ??=
          snapshot.entry.refs.map((e) => nextEntries[e]!).toSet();
    }
    final nextPending = Set.of(pending);
    for (final snapshot in snapshots) {
      if (!snapshot.isPending) {
        nextPending.remove(snapshot.entry.ref);
      }
    }
    return copyWith(
      entries: nextEntries,
      graph: DirectedGraph(nextGraphData),
      pending: nextPending,
    );
  }
}

abstract class FollowMainEffectBuilder<Event>
    implements _$EntryCollectionState<Event> {
  MainRefEffect<Event> buildMainEntryEffect(
      Entry<Event> rootEntry, EntryRef headEntryRef) {
    final mainEntry = entries[mainEntryRef];
    if (mainEntry == null) {
      return MainRefEffect.none();
    }
    final mainToHeadPath = _originPath(mainEntry, headEntryRef);

    if (mainToHeadPath.isEmpty) {
      return MainRefEffect.none();
    } else {
      if (mainToHeadPath.any((element) => pending.contains(element.ref))) {
        return MainRefEffect.none();
      } else {
        return MainRefEffect.forward(
            previous: mainEntryRef, next: headEntryRef);
      }
    }
  }

  HeadEffect<Event> buildInitialHeadEffect(
      Entry<Event> rootEntry, EntryRef headEntryRef) {
    final headEntryPath = _originPath(rootEntry, headEntryRef);
    if (headEntryPath.isEmpty) {
      return HeadEffect.none();
    } else {
      return HeadEffect.forward(headEntryRef, headEntryPath);
    }
  }

  HeadEffect<Event> buildFollowMainEffect(
      Entry<Event> rootEntry, EntryRef headEntryRef) {
    // up-to-date
    if (headEntryRef == mainEntryRef) {
      return HeadEffect.none();
    }

    // main path unknown
    final mainEntryPath = _originPath(rootEntry, mainEntryRef);
    if (mainEntryPath.isEmpty) {
      return HeadEffect.none();
    }

    // head path unknown
    final headEntryPath = _originPath(rootEntry, headEntryRef);
    if (headEntryPath.isEmpty) {
      return HeadEffect.none();
    }

    final Entry<Event>? deviant = headEntryPath.firstWhereIndexedOrNull(
        (index, element) => mainEntryPath.elementAtOrNull(index) != element);

    // deviant exists
    if (deviant != null) {
      final matchCount = headEntryPath.indexOf(deviant);

      if (mainEntryPath.length == matchCount) {
        return HeadEffect.none();
      } else {
        final resetPath = ({
          ...headEntryPath.skip(matchCount),
          ...mainEntryPath.skip(matchCount)
        }..sort())
            .toList();

        return HeadEffect.reset(headEntryRef,
            headEntryPath.take(matchCount).map((e) => e.ref), resetPath);
      }
    } else {
      return HeadEffect.forward(
          headEntryRef, mainEntryPath.skip(headEntryPath.length));
    }
  }

  List<Entry<Event>> _originPath(Entry<Event> rootEntry, EntryRef entryRef) {
    if (entryRef == rootEntry.ref) {
      return [rootEntry];
    }
    final startEntry = entries[entryRef];
    if (startEntry == null) {
      return [];
    }
    return (graph.paths(entries[entryRef]!, rootEntry).fold<Set<Entry<Event>>>(
            {},
            (previousValue, element) => Set.of(previousValue)..addAll(element))
          ..sort())
        .toList();
  }
}
