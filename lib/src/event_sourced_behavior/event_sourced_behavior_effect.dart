import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_sourced_behavior_effect.freezed.dart';

@freezed
class EventSourcedBehaviorEffect<Event>
    with _$EventSourcedBehaviorEffect<Event> {
  factory EventSourcedBehaviorEffect.persist(
    Iterable<Event> events,
  ) = EventSourcedBehaviorEffectPersist<Event>;

  factory EventSourcedBehaviorEffect.none() =
      EventSourcedBehaviorEffectNone<Event>;

  factory EventSourcedBehaviorEffect.notSupported(String message) =
      EventSourcedBehaviorEffectNotSupported<Event>;
}
