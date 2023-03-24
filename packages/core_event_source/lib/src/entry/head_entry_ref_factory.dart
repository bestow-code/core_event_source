import 'dart:math';

import '../../../entry.dart';

class HeadEntryRefFactory {
  factory HeadEntryRefFactory.basic() =>
      HeadEntryRefFactory(DateTimeFactory.now());
  factory HeadEntryRefFactory.increment([int start = 0]) =>
      HeadEntryRefFactory(DateTimeFactory.increment(start));
  HeadEntryRefFactory(this._dateTimeFactory);
  final DateTimeFactory _dateTimeFactory;

  HeadEntryRef create(EntryRef entryRef) =>
      HeadEntryRef(entryRef, _dateTimeFactory.create());
}
