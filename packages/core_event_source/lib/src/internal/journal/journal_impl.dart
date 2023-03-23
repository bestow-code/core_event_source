import '../../../internal.dart';

class JournalImpl<Event> implements Journal<Event> {
  final CoreDataStore<Event> _adapter;

  JournalImpl({
    required CoreDataStore<Event> adapter,
  }) : _adapter = adapter;

  @override
  Future<void> applyHeadEffect(HeadEffect<Event> effect) async {
    await effect.mapOrNull(
        append: (append) async => await _adapter.appendHeadEntry(append.entry),
        forward: (forward) async => await _adapter.forwardHeadEntryRef(
            forward.start, forward.entries.last.ref),
        reset: (reset) async => await _adapter.resetHeadEntryRef(
            reset.start, reset.entries.last.ref),
        merge: (merge) async {
          await _adapter.appendMergeEntry(merge.entry);
        });
  }

  @override
  Future<void> applyMainRefEffect(MainRefEffect<Event> effect) async {
    await effect.mapOrNull(
        forward: (forward) async =>
            await _adapter.updateMainEntryRef(forward.previous, forward.next));
  }
}
