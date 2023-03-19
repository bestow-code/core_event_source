import '../../../internal.dart';

class JournalImpl<Event> implements Journal<Event> {
  final DataAdapter<Event> _adapter;

  JournalImpl({
    required DataAdapter<Event> adapter,
  }) : _adapter = adapter;

  @override
  Future<void> apply(HeadEffect<Event> effect) async {
    await effect.mapOrNull(
        append: (append) async => await _adapter.appendHeadEntry(append.entry),
        forward: (forward) async => await _adapter.forwardHeadEntryRef(
            forward.start, forward.entries.last.ref),
        reset: (reset) async => await _adapter.resetHeadEntryRef(
            reset.start, reset.entries.last.ref));
  }
}
