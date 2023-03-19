import '../../../entry.dart';

class EntryRefLogFactory {
  final DateTimeFactory _dateTimeFactory;

  EntryRefLog apply({
    required EntryRef previous,
    required EntryRef next,
  }) =>
      EntryRefLog.apply(
        previousRef: previous,
        nextRef: next,
        createdAt: _dateTimeFactory.create(),
      );

  EntryRefLog forward({
    required EntryRef previous,
    required EntryRef next,
  }) =>
      EntryRefLog.forward(
        previousRef: previous,
        nextRef: next,
        createdAt: _dateTimeFactory.create(),
      );

  EntryRefLog reset({
    required EntryRef previous,
    required EntryRef next,
    // required EntryRef resetBase,
  }) =>
      EntryRefLog.reset(
        previousRef: previous,
        nextRef: next,
        // resetBaseRef: resetBase,
        createdAt: _dateTimeFactory.create(),
      );

  EntryRefLogFactory(this._dateTimeFactory);
}
