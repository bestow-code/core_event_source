import 'package:core_event_source/entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_ref_effect.freezed.dart';

@freezed
class MainRefEffect<Event> with _$MainRefEffect<Event> {
  factory MainRefEffect.none() = MainRefEffectNone<Event>;
  factory MainRefEffect.forward({
    required EntryRef previous,
    required EntryRef next,
  }) = MainRefEffectForward<Event>;
}
