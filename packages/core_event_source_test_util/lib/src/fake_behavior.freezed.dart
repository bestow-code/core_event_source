// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fake_behavior.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FakeCommand {}

/// @nodoc
abstract class $FakeCommandCopyWith<$Res> {
  factory $FakeCommandCopyWith(
          FakeCommand value, $Res Function(FakeCommand) then) =
      _$FakeCommandCopyWithImpl<$Res, FakeCommand>;
}

/// @nodoc
class _$FakeCommandCopyWithImpl<$Res, $Val extends FakeCommand>
    implements $FakeCommandCopyWith<$Res> {
  _$FakeCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FakeCommandCopyWith<$Res> {
  factory _$$_FakeCommandCopyWith(
          _$_FakeCommand value, $Res Function(_$_FakeCommand) then) =
      __$$_FakeCommandCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FakeCommandCopyWithImpl<$Res>
    extends _$FakeCommandCopyWithImpl<$Res, _$_FakeCommand>
    implements _$$_FakeCommandCopyWith<$Res> {
  __$$_FakeCommandCopyWithImpl(
      _$_FakeCommand _value, $Res Function(_$_FakeCommand) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FakeCommand implements _FakeCommand {
  _$_FakeCommand();

  @override
  String toString() {
    return 'FakeCommand()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FakeCommand);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _FakeCommand implements FakeCommand {
  factory _FakeCommand() = _$_FakeCommand;
}

FakeEvent _$FakeEventFromJson(Map<String, dynamic> json) {
  return _FakeEvent.fromJson(json);
}

/// @nodoc
mixin _$FakeEvent {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FakeEventCopyWith<$Res> {
  factory $FakeEventCopyWith(FakeEvent value, $Res Function(FakeEvent) then) =
      _$FakeEventCopyWithImpl<$Res, FakeEvent>;
}

/// @nodoc
class _$FakeEventCopyWithImpl<$Res, $Val extends FakeEvent>
    implements $FakeEventCopyWith<$Res> {
  _$FakeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FakeEventCopyWith<$Res> {
  factory _$$_FakeEventCopyWith(
          _$_FakeEvent value, $Res Function(_$_FakeEvent) then) =
      __$$_FakeEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FakeEventCopyWithImpl<$Res>
    extends _$FakeEventCopyWithImpl<$Res, _$_FakeEvent>
    implements _$$_FakeEventCopyWith<$Res> {
  __$$_FakeEventCopyWithImpl(
      _$_FakeEvent _value, $Res Function(_$_FakeEvent) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_FakeEvent implements _FakeEvent {
  _$_FakeEvent();

  factory _$_FakeEvent.fromJson(Map<String, dynamic> json) =>
      _$$_FakeEventFromJson(json);

  @override
  String toString() {
    return 'FakeEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FakeEvent);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_FakeEventToJson(
      this,
    );
  }
}

abstract class _FakeEvent implements FakeEvent {
  factory _FakeEvent() = _$_FakeEvent;

  factory _FakeEvent.fromJson(Map<String, dynamic> json) =
      _$_FakeEvent.fromJson;
}

/// @nodoc
mixin _$FakeState {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FakeStateCopyWith<FakeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FakeStateCopyWith<$Res> {
  factory $FakeStateCopyWith(FakeState value, $Res Function(FakeState) then) =
      _$FakeStateCopyWithImpl<$Res, FakeState>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$FakeStateCopyWithImpl<$Res, $Val extends FakeState>
    implements $FakeStateCopyWith<$Res> {
  _$FakeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FakeStateCopyWith<$Res> implements $FakeStateCopyWith<$Res> {
  factory _$$_FakeStateCopyWith(
          _$_FakeState value, $Res Function(_$_FakeState) then) =
      __$$_FakeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_FakeStateCopyWithImpl<$Res>
    extends _$FakeStateCopyWithImpl<$Res, _$_FakeState>
    implements _$$_FakeStateCopyWith<$Res> {
  __$$_FakeStateCopyWithImpl(
      _$_FakeState _value, $Res Function(_$_FakeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_FakeState(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FakeState implements _FakeState {
  _$_FakeState(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'FakeState(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FakeState &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FakeStateCopyWith<_$_FakeState> get copyWith =>
      __$$_FakeStateCopyWithImpl<_$_FakeState>(this, _$identity);
}

abstract class _FakeState implements FakeState {
  factory _FakeState(final int value) = _$_FakeState;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_FakeStateCopyWith<_$_FakeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FakeView {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FakeViewCopyWith<FakeView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FakeViewCopyWith<$Res> {
  factory $FakeViewCopyWith(FakeView value, $Res Function(FakeView) then) =
      _$FakeViewCopyWithImpl<$Res, FakeView>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$FakeViewCopyWithImpl<$Res, $Val extends FakeView>
    implements $FakeViewCopyWith<$Res> {
  _$FakeViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FakeViewCopyWith<$Res> implements $FakeViewCopyWith<$Res> {
  factory _$$_FakeViewCopyWith(
          _$_FakeView value, $Res Function(_$_FakeView) then) =
      __$$_FakeViewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_FakeViewCopyWithImpl<$Res>
    extends _$FakeViewCopyWithImpl<$Res, _$_FakeView>
    implements _$$_FakeViewCopyWith<$Res> {
  __$$_FakeViewCopyWithImpl(
      _$_FakeView _value, $Res Function(_$_FakeView) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_FakeView(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FakeView implements _FakeView {
  _$_FakeView(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'FakeView(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FakeView &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FakeViewCopyWith<_$_FakeView> get copyWith =>
      __$$_FakeViewCopyWithImpl<_$_FakeView>(this, _$identity);
}

abstract class _FakeView implements FakeView {
  factory _FakeView(final int value) = _$_FakeView;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_FakeViewCopyWith<_$_FakeView> get copyWith =>
      throw _privateConstructorUsedError;
}
