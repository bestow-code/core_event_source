// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_sourced_behavior_effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventSourcedBehaviorEffect<Event> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<Event> events) persist,
    required TResult Function() none,
    required TResult Function(String message) notSupported,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<Event> events)? persist,
    TResult? Function()? none,
    TResult? Function(String message)? notSupported,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Event> events)? persist,
    TResult Function()? none,
    TResult Function(String message)? notSupported,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventSourcedBehaviorEffectPersist<Event> value)
        persist,
    required TResult Function(EventSourcedBehaviorEffectNone<Event> value) none,
    required TResult Function(
            EventSourcedBehaviorEffectNotSupported<Event> value)
        notSupported,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourcedBehaviorEffectPersist<Event> value)? persist,
    TResult? Function(EventSourcedBehaviorEffectNone<Event> value)? none,
    TResult? Function(EventSourcedBehaviorEffectNotSupported<Event> value)?
        notSupported,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourcedBehaviorEffectPersist<Event> value)? persist,
    TResult Function(EventSourcedBehaviorEffectNone<Event> value)? none,
    TResult Function(EventSourcedBehaviorEffectNotSupported<Event> value)?
        notSupported,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventSourcedBehaviorEffectCopyWith<Event, $Res> {
  factory $EventSourcedBehaviorEffectCopyWith(
          EventSourcedBehaviorEffect<Event> value,
          $Res Function(EventSourcedBehaviorEffect<Event>) then) =
      _$EventSourcedBehaviorEffectCopyWithImpl<Event, $Res,
          EventSourcedBehaviorEffect<Event>>;
}

/// @nodoc
class _$EventSourcedBehaviorEffectCopyWithImpl<Event, $Res,
        $Val extends EventSourcedBehaviorEffect<Event>>
    implements $EventSourcedBehaviorEffectCopyWith<Event, $Res> {
  _$EventSourcedBehaviorEffectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EventSourcedBehaviorEffectPersistCopyWith<Event, $Res> {
  factory _$$EventSourcedBehaviorEffectPersistCopyWith(
          _$EventSourcedBehaviorEffectPersist<Event> value,
          $Res Function(_$EventSourcedBehaviorEffectPersist<Event>) then) =
      __$$EventSourcedBehaviorEffectPersistCopyWithImpl<Event, $Res>;
  @useResult
  $Res call({Iterable<Event> events});
}

/// @nodoc
class __$$EventSourcedBehaviorEffectPersistCopyWithImpl<Event, $Res>
    extends _$EventSourcedBehaviorEffectCopyWithImpl<Event, $Res,
        _$EventSourcedBehaviorEffectPersist<Event>>
    implements _$$EventSourcedBehaviorEffectPersistCopyWith<Event, $Res> {
  __$$EventSourcedBehaviorEffectPersistCopyWithImpl(
      _$EventSourcedBehaviorEffectPersist<Event> _value,
      $Res Function(_$EventSourcedBehaviorEffectPersist<Event>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
  }) {
    return _then(_$EventSourcedBehaviorEffectPersist<Event>(
      null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as Iterable<Event>,
    ));
  }
}

/// @nodoc

class _$EventSourcedBehaviorEffectPersist<Event>
    implements EventSourcedBehaviorEffectPersist<Event> {
  _$EventSourcedBehaviorEffectPersist(this.events);

  @override
  final Iterable<Event> events;

  @override
  String toString() {
    return 'EventSourcedBehaviorEffect<$Event>.persist(events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSourcedBehaviorEffectPersist<Event> &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSourcedBehaviorEffectPersistCopyWith<Event,
          _$EventSourcedBehaviorEffectPersist<Event>>
      get copyWith => __$$EventSourcedBehaviorEffectPersistCopyWithImpl<Event,
          _$EventSourcedBehaviorEffectPersist<Event>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<Event> events) persist,
    required TResult Function() none,
    required TResult Function(String message) notSupported,
  }) {
    return persist(events);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<Event> events)? persist,
    TResult? Function()? none,
    TResult? Function(String message)? notSupported,
  }) {
    return persist?.call(events);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Event> events)? persist,
    TResult Function()? none,
    TResult Function(String message)? notSupported,
    required TResult orElse(),
  }) {
    if (persist != null) {
      return persist(events);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventSourcedBehaviorEffectPersist<Event> value)
        persist,
    required TResult Function(EventSourcedBehaviorEffectNone<Event> value) none,
    required TResult Function(
            EventSourcedBehaviorEffectNotSupported<Event> value)
        notSupported,
  }) {
    return persist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourcedBehaviorEffectPersist<Event> value)? persist,
    TResult? Function(EventSourcedBehaviorEffectNone<Event> value)? none,
    TResult? Function(EventSourcedBehaviorEffectNotSupported<Event> value)?
        notSupported,
  }) {
    return persist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourcedBehaviorEffectPersist<Event> value)? persist,
    TResult Function(EventSourcedBehaviorEffectNone<Event> value)? none,
    TResult Function(EventSourcedBehaviorEffectNotSupported<Event> value)?
        notSupported,
    required TResult orElse(),
  }) {
    if (persist != null) {
      return persist(this);
    }
    return orElse();
  }
}

abstract class EventSourcedBehaviorEffectPersist<Event>
    implements EventSourcedBehaviorEffect<Event> {
  factory EventSourcedBehaviorEffectPersist(final Iterable<Event> events) =
      _$EventSourcedBehaviorEffectPersist<Event>;

  Iterable<Event> get events;
  @JsonKey(ignore: true)
  _$$EventSourcedBehaviorEffectPersistCopyWith<Event,
          _$EventSourcedBehaviorEffectPersist<Event>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventSourcedBehaviorEffectNoneCopyWith<Event, $Res> {
  factory _$$EventSourcedBehaviorEffectNoneCopyWith(
          _$EventSourcedBehaviorEffectNone<Event> value,
          $Res Function(_$EventSourcedBehaviorEffectNone<Event>) then) =
      __$$EventSourcedBehaviorEffectNoneCopyWithImpl<Event, $Res>;
}

/// @nodoc
class __$$EventSourcedBehaviorEffectNoneCopyWithImpl<Event, $Res>
    extends _$EventSourcedBehaviorEffectCopyWithImpl<Event, $Res,
        _$EventSourcedBehaviorEffectNone<Event>>
    implements _$$EventSourcedBehaviorEffectNoneCopyWith<Event, $Res> {
  __$$EventSourcedBehaviorEffectNoneCopyWithImpl(
      _$EventSourcedBehaviorEffectNone<Event> _value,
      $Res Function(_$EventSourcedBehaviorEffectNone<Event>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventSourcedBehaviorEffectNone<Event>
    implements EventSourcedBehaviorEffectNone<Event> {
  _$EventSourcedBehaviorEffectNone();

  @override
  String toString() {
    return 'EventSourcedBehaviorEffect<$Event>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSourcedBehaviorEffectNone<Event>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<Event> events) persist,
    required TResult Function() none,
    required TResult Function(String message) notSupported,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<Event> events)? persist,
    TResult? Function()? none,
    TResult? Function(String message)? notSupported,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Event> events)? persist,
    TResult Function()? none,
    TResult Function(String message)? notSupported,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventSourcedBehaviorEffectPersist<Event> value)
        persist,
    required TResult Function(EventSourcedBehaviorEffectNone<Event> value) none,
    required TResult Function(
            EventSourcedBehaviorEffectNotSupported<Event> value)
        notSupported,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourcedBehaviorEffectPersist<Event> value)? persist,
    TResult? Function(EventSourcedBehaviorEffectNone<Event> value)? none,
    TResult? Function(EventSourcedBehaviorEffectNotSupported<Event> value)?
        notSupported,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourcedBehaviorEffectPersist<Event> value)? persist,
    TResult Function(EventSourcedBehaviorEffectNone<Event> value)? none,
    TResult Function(EventSourcedBehaviorEffectNotSupported<Event> value)?
        notSupported,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class EventSourcedBehaviorEffectNone<Event>
    implements EventSourcedBehaviorEffect<Event> {
  factory EventSourcedBehaviorEffectNone() =
      _$EventSourcedBehaviorEffectNone<Event>;
}

/// @nodoc
abstract class _$$EventSourcedBehaviorEffectNotSupportedCopyWith<Event, $Res> {
  factory _$$EventSourcedBehaviorEffectNotSupportedCopyWith(
          _$EventSourcedBehaviorEffectNotSupported<Event> value,
          $Res Function(_$EventSourcedBehaviorEffectNotSupported<Event>) then) =
      __$$EventSourcedBehaviorEffectNotSupportedCopyWithImpl<Event, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EventSourcedBehaviorEffectNotSupportedCopyWithImpl<Event, $Res>
    extends _$EventSourcedBehaviorEffectCopyWithImpl<Event, $Res,
        _$EventSourcedBehaviorEffectNotSupported<Event>>
    implements _$$EventSourcedBehaviorEffectNotSupportedCopyWith<Event, $Res> {
  __$$EventSourcedBehaviorEffectNotSupportedCopyWithImpl(
      _$EventSourcedBehaviorEffectNotSupported<Event> _value,
      $Res Function(_$EventSourcedBehaviorEffectNotSupported<Event>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$EventSourcedBehaviorEffectNotSupported<Event>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EventSourcedBehaviorEffectNotSupported<Event>
    implements EventSourcedBehaviorEffectNotSupported<Event> {
  _$EventSourcedBehaviorEffectNotSupported(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EventSourcedBehaviorEffect<$Event>.notSupported(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSourcedBehaviorEffectNotSupported<Event> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSourcedBehaviorEffectNotSupportedCopyWith<Event,
          _$EventSourcedBehaviorEffectNotSupported<Event>>
      get copyWith => __$$EventSourcedBehaviorEffectNotSupportedCopyWithImpl<
          Event,
          _$EventSourcedBehaviorEffectNotSupported<Event>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<Event> events) persist,
    required TResult Function() none,
    required TResult Function(String message) notSupported,
  }) {
    return notSupported(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<Event> events)? persist,
    TResult? Function()? none,
    TResult? Function(String message)? notSupported,
  }) {
    return notSupported?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Event> events)? persist,
    TResult Function()? none,
    TResult Function(String message)? notSupported,
    required TResult orElse(),
  }) {
    if (notSupported != null) {
      return notSupported(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventSourcedBehaviorEffectPersist<Event> value)
        persist,
    required TResult Function(EventSourcedBehaviorEffectNone<Event> value) none,
    required TResult Function(
            EventSourcedBehaviorEffectNotSupported<Event> value)
        notSupported,
  }) {
    return notSupported(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourcedBehaviorEffectPersist<Event> value)? persist,
    TResult? Function(EventSourcedBehaviorEffectNone<Event> value)? none,
    TResult? Function(EventSourcedBehaviorEffectNotSupported<Event> value)?
        notSupported,
  }) {
    return notSupported?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourcedBehaviorEffectPersist<Event> value)? persist,
    TResult Function(EventSourcedBehaviorEffectNone<Event> value)? none,
    TResult Function(EventSourcedBehaviorEffectNotSupported<Event> value)?
        notSupported,
    required TResult orElse(),
  }) {
    if (notSupported != null) {
      return notSupported(this);
    }
    return orElse();
  }
}

abstract class EventSourcedBehaviorEffectNotSupported<Event>
    implements EventSourcedBehaviorEffect<Event> {
  factory EventSourcedBehaviorEffectNotSupported(final String message) =
      _$EventSourcedBehaviorEffectNotSupported<Event>;

  String get message;
  @JsonKey(ignore: true)
  _$$EventSourcedBehaviorEffectNotSupportedCopyWith<Event,
          _$EventSourcedBehaviorEffectNotSupported<Event>>
      get copyWith => throw _privateConstructorUsedError;
}
