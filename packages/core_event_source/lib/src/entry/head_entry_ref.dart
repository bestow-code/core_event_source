import 'package:core_event_source/entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common.dart';

part 'head_entry_ref.freezed.dart';
part 'head_entry_ref.g.dart';

@freezed
class HeadEntryRef with _$HeadEntryRef {
  const factory HeadEntryRef(
    EntryRef entryRef,
    @DateTimeConverter() DateTime createdAt,
  ) = _HeadEntryRef;

  factory HeadEntryRef.fromJson(Map<String, dynamic> json) =>
      _$HeadEntryRefFromJson(json);
}
