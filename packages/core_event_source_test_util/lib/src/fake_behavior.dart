import 'package:core_event_source/common.dart';
import 'package:core_event_source/event_source.dart';
import 'package:core_event_source/event_sourced_behavior.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fake_behavior.freezed.dart';
part 'fake_behavior.g.dart';

@freezed
class FakeCommand with _$FakeCommand {
  factory FakeCommand() = _FakeCommand;
}

@freezed
class FakeEvent with _$FakeEvent {
  factory FakeEvent() = _FakeEvent;

  factory FakeEvent.fromJson(Map<String, dynamic> json) =>
      _$FakeEventFromJson(json);
}

@freezed
class FakeState with _$FakeState {
  factory FakeState(int value) = _FakeState;
}

@freezed
class FakeView with _$FakeView {
  factory FakeView(int value) = _FakeView;
}

class FakeBehavior
    implements
        EventSourcedBehavior<FakeCommand, FakeEvent, FakeState, FakeView> {
  @override
  CommandHandler<FakeCommand, FakeEvent, FakeState> get commandHandler =>
      (state, command) => EventSourcedBehaviorEffect.persist([FakeEvent()]);

  @override
  StateEventHandler<FakeEvent, FakeState> get eventHandler =>
      (state, _) => state.copyWith(value: state.value + 1);

  @override
  FakeState get initialState => FakeState(0);

  @override
  FakeView get initialView => FakeView(1);

  @override
  ViewEventHandler<FakeEvent, FakeView> get viewHandler =>
      (previous, _) => previous.copyWith(value: previous.value * 2);
}

class FakeEventJsonConverter extends JsonEventConverter<FakeEvent> {
  FakeEventJsonConverter()
      : super((p0) => FakeEvent.fromJson(p0 as Map<String, dynamic>),
            (object) => object.toJson());
}
