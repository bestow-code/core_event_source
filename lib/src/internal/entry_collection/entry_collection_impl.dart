import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../entry.dart';
import '../../../internal.dart';

class EntryCollectionImpl<Event> extends BlocBase<EntryCollectionState<Event>>
    implements EntryCollection<Event> {
  final Entry<Event> _initialEntry;
  final Stream<Iterable<EntrySnapshot<Event>>> _entrySnapshotsStream;
  final Stream<EntryRef> _mainEntryRefStream;
  final void Function(Object error, StackTrace stackTrace) _onError;

  factory EntryCollectionImpl.initial(
    Entry<Event> rootEntry,
    EntryRef mainEntryRef, {
    required Stream<EntryRef> mainEntryRefStream,
    required Stream<Iterable<EntrySnapshot<Event>>> entrySnapshotsStream,
    required void Function(Object error, StackTrace stackTrace) onError,
  }) =>
      EntryCollectionImpl(
        EntryCollectionState.initial(
          rootEntry: rootEntry,
          mainEntryRef: mainEntryRef,
        ),
        initialEntry: rootEntry,
        onError: onError,
        mainEntryRefStream: mainEntryRefStream,
        entrySnapshotsStream: entrySnapshotsStream,
      );

  Iterable<StreamSubscription>? _subscriptions;

  EntryCollectionImpl(
    super.state, {
    required Entry<Event> initialEntry,
    required Stream<Iterable<EntrySnapshot<Event>>> entrySnapshotsStream,
    required void Function(Object error, StackTrace stackTrace) onError,
    required Stream<EntryRef> mainEntryRefStream,
  })  : _initialEntry = initialEntry,
        _entrySnapshotsStream = entrySnapshotsStream,
        _onError = onError,
        _mainEntryRefStream = mainEntryRefStream;
  void start() {
    _subscriptions = [
      _mainEntryRefStream.listen(_mainEntryRefUpdate),
      _entrySnapshotsStream.listen(_applySnapshots),
    ];
  }

  @override
  HeadEffect<Event> buildMerge(EntryRef headEntryRef) =>
      state.buildFollowMainEffect(_initialEntry, headEntryRef);

  @override
  void apply(HeadEffect<Event> effect) =>
      effect.mapOrNull(append: (append) => emit(state.add(append.entry)));

  void _applySnapshots(Iterable<EntrySnapshot<Event>> snapshots) =>
      emit(state.applySnapshots(snapshots));

  void _mainEntryRefUpdate(EntryRef entryRef) =>
      emit(state.copyWith(mainEntryRef: entryRef));

  @override
  BlocBase<void> get updates => this;

  @override
  Future<void> close() async {
    await Future.wait(_subscriptions?.map((e) => e.cancel()) ?? []);
    return super.close();
  }

  @override
  @protected
  @mustCallSuper
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    _onError(error, stackTrace);
  }

  @override
  HeadEffect<Event> buildInitial(EntryRef headRef) =>
      state.buildInitialHeadEffect(_initialEntry, headRef);
}
