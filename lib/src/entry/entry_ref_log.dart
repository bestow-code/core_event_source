import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entry.dart';
import '../../common.dart';

part 'entry_ref_log.freezed.dart';
part 'entry_ref_log.g.dart';

@freezed
class EntryRefLog with _$EntryRefLog {
  // factory RefLog.initial({required EntryRef nextRef}) = RefLogInitial;
  factory EntryRefLog.reset({
    required EntryRef previousRef,
    required EntryRef nextRef,
    @DateTimeConverter() required DateTime createdAt,
  }) = EntryRefLogUpdate;
  factory EntryRefLog.forward({
    required EntryRef previousRef,
    required EntryRef nextRef,
    @DateTimeConverter() required DateTime createdAt,
  }) = EntryRefLogForward;

  factory EntryRefLog.apply({
    required EntryRef previousRef,
    required EntryRef nextRef,
    @DateTimeConverter() required DateTime createdAt,
  }) = EntryRefLogFastForward;

  factory EntryRefLog.fromJson(Map<String, dynamic> json) =>
      _$EntryRefLogFromJson(json);
}
