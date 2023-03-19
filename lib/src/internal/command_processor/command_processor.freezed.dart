// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_processor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StateEvents<Event, State> {
  State get state => throw _privateConstructorUsedError;
  Iterable<Event> get events => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StateEventsCopyWith<Event, State, StateEvents<Event, State>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateEventsCopyWith<Event, State, $Res> {
  factory $StateEventsCopyWith(StateEvents<Event, State> value,
          $Res Function(StateEvents<Event, State>) then) =
      _$StateEventsCopyWithImpl<Event, State, $Res, StateEvents<Event, State>>;
  @useResult
  $Res call({State state, Iterable<Event> events});
}

/// @nodoc
class _$StateEventsCopyWithImpl<Event, State, $Res,
        $Val extends StateEvents<Event, State>>
    implements $StateEventsCopyWith<Event, State, $Res> {
  _$StateEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as State,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as Iterable<Event>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateEventsCopyWith<Event, State, $Res>
    implements $StateEventsCopyWith<Event, State, $Res> {
  factory _$$_StateEventsCopyWith(_$_StateEvents<Event, State> value,
          $Res Function(_$_StateEvents<Event, State>) then) =
      __$$_StateEventsCopyWithImpl<Event, State, $Res>;
  @override
  @useResult
  $Res call({State state, Iterable<Event> events});
}

/// @nodoc
class __$$_StateEventsCopyWithImpl<Event, State, $Res>
    extends _$StateEventsCopyWithImpl<Event, State, $Res,
        _$_StateEvents<Event, State>>
    implements _$$_StateEventsCopyWith<Event, State, $Res> {
  __$$_StateEventsCopyWithImpl(_$_StateEvents<Event, State> _value,
      $Res Function(_$_StateEvents<Event, State>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? events = null,
  }) {
    return _then(_$_StateEvents<Event, State>(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as State,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as Iterable<Event>,
    ));
  }
}

/// @nodoc

class _$_StateEvents<Event, State> implements _StateEvents<Event, State> {
  _$_StateEvents({required this.state, required this.events});

  @override
  final State state;
  @override
  final Iterable<Event> events;

  @override
  String toString() {
    return 'StateEvents<$Event, $State>(state: $state, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StateEvents<Event, State> &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateEventsCopyWith<Event, State, _$_StateEvents<Event, State>>
      get copyWith => __$$_StateEventsCopyWithImpl<Event, State,
          _$_StateEvents<Event, State>>(this, _$identity);
}

abstract class _StateEvents<Event, State> implements StateEvents<Event, State> {
  factory _StateEvents(
      {required final State state,
      required final Iterable<Event> events}) = _$_StateEvents<Event, State>;

  @override
  State get state;
  @override
  Iterable<Event> get events;
  @override
  @JsonKey(ignore: true)
  _$$_StateEventsCopyWith<Event, State, _$_StateEvents<Event, State>>
      get copyWith => throw _privateConstructorUsedError;
}
