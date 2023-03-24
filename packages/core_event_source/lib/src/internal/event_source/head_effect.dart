import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entry.dart';

part 'head_effect.freezed.dart';

@freezed
class HeadEffect<Event> with _$HeadEffect<Event> {
  factory HeadEffect.append(EntryRef start, Entry<Event> entry) =
      HeadEffectAppend<Event>;

  @Assert('entries.isNotEmpty')
  factory HeadEffect.forward(EntryRef start, Iterable<Entry<Event>> entries) =
      HeadEffectForward<Event>;

  @Assert('entries.isNotEmpty')
  factory HeadEffect.reset(EntryRef start, Iterable<EntryRef> base,
      Iterable<Entry<Event>> entries) = HeadEffectReset<Event>;
  @Assert('entries.isNotEmpty')
  factory HeadEffect.merge(
      EntryRef start, Iterable<EntryRef> base, Iterable<Entry<Event>> entries,
      {required Entry<Event> entry}) = HeadEffectMerge<Event>;

  factory HeadEffect.none() = HeadEffectNone;
}
