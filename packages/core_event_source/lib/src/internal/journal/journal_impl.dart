import '../../../entry.dart';
import '../../../internal.dart';

class JournalImpl<Event> implements Journal<Event> {
  final CoreDataStore<Event> _adapter;
  final HeadEntryRefFactory headEntryRefFactory;

  JournalImpl({
    required this.headEntryRefFactory,
    required CoreDataStore<Event> adapter,
  }) : _adapter = adapter;

  @override
  Future<void> applyHeadEffect(HeadEffect<Event> effect) async {
    await effect.mapOrNull(
        append: (append) async => await _adapter.appendHeadEntry(
            append.entry, headEntryRefFactory.create(append.entry.ref)),
        forward: (forward) async => await _adapter.forwardHeadEntryRef(
            forward.start,
            headEntryRefFactory.create(forward.entries.last.ref)),
        reset: (reset) async => await _adapter.resetHeadEntryRef(
            reset.start, headEntryRefFactory.create(reset.entries.last.ref)),
        merge: (merge) async {
          await _adapter.appendMergeEntry(
              merge.entry, headEntryRefFactory.create(merge.entry.ref));
        });
  }

  @override
  Future<void> applyMainRefEffect(MainRefEffect<Event> effect) async {
    await effect.mapOrNull(
        forward: (forward) async =>
            await _adapter.updateMainEntryRef(forward.previous, forward.next));
  }
}
