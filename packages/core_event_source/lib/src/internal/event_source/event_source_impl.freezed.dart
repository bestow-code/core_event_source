// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_source_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventSourceEvent<Command, Event> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<Command> commands) commandsApply,
    required TResult Function() entryCollectionUpdate,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<Command> commands)? commandsApply,
    TResult? Function()? entryCollectionUpdate,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Command> commands)? commandsApply,
    TResult Function()? entryCollectionUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            EventSourceEventCommandsApply<Command, Event> value)
        commandsApply,
    required TResult Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)
        entryCollectionUpdate,
    required TResult Function(EventSourceEventError<Command, Event> value)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourceEventCommandsApply<Command, Event> value)?
        commandsApply,
    TResult? Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)?
        entryCollectionUpdate,
    TResult? Function(EventSourceEventError<Command, Event> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourceEventCommandsApply<Command, Event> value)?
        commandsApply,
    TResult Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)?
        entryCollectionUpdate,
    TResult Function(EventSourceEventError<Command, Event> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventSourceEventCopyWith<Command, Event, $Res> {
  factory $EventSourceEventCopyWith(EventSourceEvent<Command, Event> value,
          $Res Function(EventSourceEvent<Command, Event>) then) =
      _$EventSourceEventCopyWithImpl<Command, Event, $Res,
          EventSourceEvent<Command, Event>>;
}

/// @nodoc
class _$EventSourceEventCopyWithImpl<Command, Event, $Res,
        $Val extends EventSourceEvent<Command, Event>>
    implements $EventSourceEventCopyWith<Command, Event, $Res> {
  _$EventSourceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EventSourceEventCommandsApplyCopyWith<Command, Event, $Res> {
  factory _$$EventSourceEventCommandsApplyCopyWith(
          _$EventSourceEventCommandsApply<Command, Event> value,
          $Res Function(_$EventSourceEventCommandsApply<Command, Event>) then) =
      __$$EventSourceEventCommandsApplyCopyWithImpl<Command, Event, $Res>;
  @useResult
  $Res call({Iterable<Command> commands});
}

/// @nodoc
class __$$EventSourceEventCommandsApplyCopyWithImpl<Command, Event, $Res>
    extends _$EventSourceEventCopyWithImpl<Command, Event, $Res,
        _$EventSourceEventCommandsApply<Command, Event>>
    implements _$$EventSourceEventCommandsApplyCopyWith<Command, Event, $Res> {
  __$$EventSourceEventCommandsApplyCopyWithImpl(
      _$EventSourceEventCommandsApply<Command, Event> _value,
      $Res Function(_$EventSourceEventCommandsApply<Command, Event>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commands = null,
  }) {
    return _then(_$EventSourceEventCommandsApply<Command, Event>(
      null == commands
          ? _value.commands
          : commands // ignore: cast_nullable_to_non_nullable
              as Iterable<Command>,
    ));
  }
}

/// @nodoc

class _$EventSourceEventCommandsApply<Command, Event>
    implements EventSourceEventCommandsApply<Command, Event> {
  _$EventSourceEventCommandsApply(this.commands);

  @override
  final Iterable<Command> commands;

  @override
  String toString() {
    return 'EventSourceEvent<$Command, $Event>.commandsApply(commands: $commands)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSourceEventCommandsApply<Command, Event> &&
            const DeepCollectionEquality().equals(other.commands, commands));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(commands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSourceEventCommandsApplyCopyWith<Command, Event,
          _$EventSourceEventCommandsApply<Command, Event>>
      get copyWith => __$$EventSourceEventCommandsApplyCopyWithImpl<
          Command,
          Event,
          _$EventSourceEventCommandsApply<Command, Event>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<Command> commands) commandsApply,
    required TResult Function() entryCollectionUpdate,
    required TResult Function() error,
  }) {
    return commandsApply(commands);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<Command> commands)? commandsApply,
    TResult? Function()? entryCollectionUpdate,
    TResult? Function()? error,
  }) {
    return commandsApply?.call(commands);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Command> commands)? commandsApply,
    TResult Function()? entryCollectionUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (commandsApply != null) {
      return commandsApply(commands);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            EventSourceEventCommandsApply<Command, Event> value)
        commandsApply,
    required TResult Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)
        entryCollectionUpdate,
    required TResult Function(EventSourceEventError<Command, Event> value)
        error,
  }) {
    return commandsApply(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourceEventCommandsApply<Command, Event> value)?
        commandsApply,
    TResult? Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)?
        entryCollectionUpdate,
    TResult? Function(EventSourceEventError<Command, Event> value)? error,
  }) {
    return commandsApply?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourceEventCommandsApply<Command, Event> value)?
        commandsApply,
    TResult Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)?
        entryCollectionUpdate,
    TResult Function(EventSourceEventError<Command, Event> value)? error,
    required TResult orElse(),
  }) {
    if (commandsApply != null) {
      return commandsApply(this);
    }
    return orElse();
  }
}

abstract class EventSourceEventCommandsApply<Command, Event>
    implements EventSourceEvent<Command, Event> {
  factory EventSourceEventCommandsApply(final Iterable<Command> commands) =
      _$EventSourceEventCommandsApply<Command, Event>;

  Iterable<Command> get commands;
  @JsonKey(ignore: true)
  _$$EventSourceEventCommandsApplyCopyWith<Command, Event,
          _$EventSourceEventCommandsApply<Command, Event>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventSourceEventEntryCollectionUpdateCopyWith<Command, Event,
    $Res> {
  factory _$$EventSourceEventEntryCollectionUpdateCopyWith(
      _$EventSourceEventEntryCollectionUpdate<Command, Event> value,
      $Res Function(_$EventSourceEventEntryCollectionUpdate<Command, Event>)
          then) = __$$EventSourceEventEntryCollectionUpdateCopyWithImpl<Command,
      Event, $Res>;
}

/// @nodoc
class __$$EventSourceEventEntryCollectionUpdateCopyWithImpl<Command, Event,
        $Res>
    extends _$EventSourceEventCopyWithImpl<Command, Event, $Res,
        _$EventSourceEventEntryCollectionUpdate<Command, Event>>
    implements
        _$$EventSourceEventEntryCollectionUpdateCopyWith<Command, Event, $Res> {
  __$$EventSourceEventEntryCollectionUpdateCopyWithImpl(
      _$EventSourceEventEntryCollectionUpdate<Command, Event> _value,
      $Res Function(_$EventSourceEventEntryCollectionUpdate<Command, Event>)
          _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventSourceEventEntryCollectionUpdate<Command, Event>
    implements EventSourceEventEntryCollectionUpdate<Command, Event> {
  _$EventSourceEventEntryCollectionUpdate();

  @override
  String toString() {
    return 'EventSourceEvent<$Command, $Event>.entryCollectionUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSourceEventEntryCollectionUpdate<Command, Event>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<Command> commands) commandsApply,
    required TResult Function() entryCollectionUpdate,
    required TResult Function() error,
  }) {
    return entryCollectionUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<Command> commands)? commandsApply,
    TResult? Function()? entryCollectionUpdate,
    TResult? Function()? error,
  }) {
    return entryCollectionUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Command> commands)? commandsApply,
    TResult Function()? entryCollectionUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (entryCollectionUpdate != null) {
      return entryCollectionUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            EventSourceEventCommandsApply<Command, Event> value)
        commandsApply,
    required TResult Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)
        entryCollectionUpdate,
    required TResult Function(EventSourceEventError<Command, Event> value)
        error,
  }) {
    return entryCollectionUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourceEventCommandsApply<Command, Event> value)?
        commandsApply,
    TResult? Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)?
        entryCollectionUpdate,
    TResult? Function(EventSourceEventError<Command, Event> value)? error,
  }) {
    return entryCollectionUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourceEventCommandsApply<Command, Event> value)?
        commandsApply,
    TResult Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)?
        entryCollectionUpdate,
    TResult Function(EventSourceEventError<Command, Event> value)? error,
    required TResult orElse(),
  }) {
    if (entryCollectionUpdate != null) {
      return entryCollectionUpdate(this);
    }
    return orElse();
  }
}

abstract class EventSourceEventEntryCollectionUpdate<Command, Event>
    implements EventSourceEvent<Command, Event> {
  factory EventSourceEventEntryCollectionUpdate() =
      _$EventSourceEventEntryCollectionUpdate<Command, Event>;
}

/// @nodoc
abstract class _$$EventSourceEventErrorCopyWith<Command, Event, $Res> {
  factory _$$EventSourceEventErrorCopyWith(
          _$EventSourceEventError<Command, Event> value,
          $Res Function(_$EventSourceEventError<Command, Event>) then) =
      __$$EventSourceEventErrorCopyWithImpl<Command, Event, $Res>;
}

/// @nodoc
class __$$EventSourceEventErrorCopyWithImpl<Command, Event, $Res>
    extends _$EventSourceEventCopyWithImpl<Command, Event, $Res,
        _$EventSourceEventError<Command, Event>>
    implements _$$EventSourceEventErrorCopyWith<Command, Event, $Res> {
  __$$EventSourceEventErrorCopyWithImpl(
      _$EventSourceEventError<Command, Event> _value,
      $Res Function(_$EventSourceEventError<Command, Event>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventSourceEventError<Command, Event>
    implements EventSourceEventError<Command, Event> {
  _$EventSourceEventError();

  @override
  String toString() {
    return 'EventSourceEvent<$Command, $Event>.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSourceEventError<Command, Event>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<Command> commands) commandsApply,
    required TResult Function() entryCollectionUpdate,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<Command> commands)? commandsApply,
    TResult? Function()? entryCollectionUpdate,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<Command> commands)? commandsApply,
    TResult Function()? entryCollectionUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            EventSourceEventCommandsApply<Command, Event> value)
        commandsApply,
    required TResult Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)
        entryCollectionUpdate,
    required TResult Function(EventSourceEventError<Command, Event> value)
        error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourceEventCommandsApply<Command, Event> value)?
        commandsApply,
    TResult? Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)?
        entryCollectionUpdate,
    TResult? Function(EventSourceEventError<Command, Event> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourceEventCommandsApply<Command, Event> value)?
        commandsApply,
    TResult Function(
            EventSourceEventEntryCollectionUpdate<Command, Event> value)?
        entryCollectionUpdate,
    TResult Function(EventSourceEventError<Command, Event> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class EventSourceEventError<Command, Event>
    implements EventSourceEvent<Command, Event> {
  factory EventSourceEventError() = _$EventSourceEventError<Command, Event>;
}

/// @nodoc
mixin _$EventSourceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EntryRef headEntryRef) initial,
    required TResult Function(EntryRef entryRef) ready,
    required TResult Function(Object error, StackTrace? stackTrace) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EntryRef headEntryRef)? initial,
    TResult? Function(EntryRef entryRef)? ready,
    TResult? Function(Object error, StackTrace? stackTrace)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EntryRef headEntryRef)? initial,
    TResult Function(EntryRef entryRef)? ready,
    TResult Function(Object error, StackTrace? stackTrace)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventSourceStateInitial value) initial,
    required TResult Function(EventSourceStateReady value) ready,
    required TResult Function(EventSourceStateFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourceStateInitial value)? initial,
    TResult? Function(EventSourceStateReady value)? ready,
    TResult? Function(EventSourceStateFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourceStateInitial value)? initial,
    TResult Function(EventSourceStateReady value)? ready,
    TResult Function(EventSourceStateFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventSourceStateCopyWith<$Res> {
  factory $EventSourceStateCopyWith(
          EventSourceState value, $Res Function(EventSourceState) then) =
      _$EventSourceStateCopyWithImpl<$Res, EventSourceState>;
}

/// @nodoc
class _$EventSourceStateCopyWithImpl<$Res, $Val extends EventSourceState>
    implements $EventSourceStateCopyWith<$Res> {
  _$EventSourceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EventSourceStateInitialCopyWith<$Res> {
  factory _$$EventSourceStateInitialCopyWith(_$EventSourceStateInitial value,
          $Res Function(_$EventSourceStateInitial) then) =
      __$$EventSourceStateInitialCopyWithImpl<$Res>;
  @useResult
  $Res call({EntryRef headEntryRef});

  $EntryRefCopyWith<$Res> get headEntryRef;
}

/// @nodoc
class __$$EventSourceStateInitialCopyWithImpl<$Res>
    extends _$EventSourceStateCopyWithImpl<$Res, _$EventSourceStateInitial>
    implements _$$EventSourceStateInitialCopyWith<$Res> {
  __$$EventSourceStateInitialCopyWithImpl(_$EventSourceStateInitial _value,
      $Res Function(_$EventSourceStateInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headEntryRef = null,
  }) {
    return _then(_$EventSourceStateInitial(
      null == headEntryRef
          ? _value.headEntryRef
          : headEntryRef // ignore: cast_nullable_to_non_nullable
              as EntryRef,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get headEntryRef {
    return $EntryRefCopyWith<$Res>(_value.headEntryRef, (value) {
      return _then(_value.copyWith(headEntryRef: value));
    });
  }
}

/// @nodoc

class _$EventSourceStateInitial implements EventSourceStateInitial {
  _$EventSourceStateInitial(this.headEntryRef);

// EntryRef rootEntryRef,
  @override
  final EntryRef headEntryRef;

  @override
  String toString() {
    return 'EventSourceState.initial(headEntryRef: $headEntryRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSourceStateInitial &&
            (identical(other.headEntryRef, headEntryRef) ||
                other.headEntryRef == headEntryRef));
  }

  @override
  int get hashCode => Object.hash(runtimeType, headEntryRef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSourceStateInitialCopyWith<_$EventSourceStateInitial> get copyWith =>
      __$$EventSourceStateInitialCopyWithImpl<_$EventSourceStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EntryRef headEntryRef) initial,
    required TResult Function(EntryRef entryRef) ready,
    required TResult Function(Object error, StackTrace? stackTrace) failure,
  }) {
    return initial(headEntryRef);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EntryRef headEntryRef)? initial,
    TResult? Function(EntryRef entryRef)? ready,
    TResult? Function(Object error, StackTrace? stackTrace)? failure,
  }) {
    return initial?.call(headEntryRef);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EntryRef headEntryRef)? initial,
    TResult Function(EntryRef entryRef)? ready,
    TResult Function(Object error, StackTrace? stackTrace)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(headEntryRef);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventSourceStateInitial value) initial,
    required TResult Function(EventSourceStateReady value) ready,
    required TResult Function(EventSourceStateFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourceStateInitial value)? initial,
    TResult? Function(EventSourceStateReady value)? ready,
    TResult? Function(EventSourceStateFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourceStateInitial value)? initial,
    TResult Function(EventSourceStateReady value)? ready,
    TResult Function(EventSourceStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class EventSourceStateInitial implements EventSourceState {
  factory EventSourceStateInitial(final EntryRef headEntryRef) =
      _$EventSourceStateInitial;

// EntryRef rootEntryRef,
  EntryRef get headEntryRef;
  @JsonKey(ignore: true)
  _$$EventSourceStateInitialCopyWith<_$EventSourceStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventSourceStateReadyCopyWith<$Res> {
  factory _$$EventSourceStateReadyCopyWith(_$EventSourceStateReady value,
          $Res Function(_$EventSourceStateReady) then) =
      __$$EventSourceStateReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({EntryRef entryRef});

  $EntryRefCopyWith<$Res> get entryRef;
}

/// @nodoc
class __$$EventSourceStateReadyCopyWithImpl<$Res>
    extends _$EventSourceStateCopyWithImpl<$Res, _$EventSourceStateReady>
    implements _$$EventSourceStateReadyCopyWith<$Res> {
  __$$EventSourceStateReadyCopyWithImpl(_$EventSourceStateReady _value,
      $Res Function(_$EventSourceStateReady) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryRef = null,
  }) {
    return _then(_$EventSourceStateReady(
      null == entryRef
          ? _value.entryRef
          : entryRef // ignore: cast_nullable_to_non_nullable
              as EntryRef,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get entryRef {
    return $EntryRefCopyWith<$Res>(_value.entryRef, (value) {
      return _then(_value.copyWith(entryRef: value));
    });
  }
}

/// @nodoc

class _$EventSourceStateReady implements EventSourceStateReady {
  _$EventSourceStateReady(this.entryRef);

  @override
  final EntryRef entryRef;

  @override
  String toString() {
    return 'EventSourceState.ready(entryRef: $entryRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSourceStateReady &&
            (identical(other.entryRef, entryRef) ||
                other.entryRef == entryRef));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entryRef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSourceStateReadyCopyWith<_$EventSourceStateReady> get copyWith =>
      __$$EventSourceStateReadyCopyWithImpl<_$EventSourceStateReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EntryRef headEntryRef) initial,
    required TResult Function(EntryRef entryRef) ready,
    required TResult Function(Object error, StackTrace? stackTrace) failure,
  }) {
    return ready(entryRef);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EntryRef headEntryRef)? initial,
    TResult? Function(EntryRef entryRef)? ready,
    TResult? Function(Object error, StackTrace? stackTrace)? failure,
  }) {
    return ready?.call(entryRef);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EntryRef headEntryRef)? initial,
    TResult Function(EntryRef entryRef)? ready,
    TResult Function(Object error, StackTrace? stackTrace)? failure,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(entryRef);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventSourceStateInitial value) initial,
    required TResult Function(EventSourceStateReady value) ready,
    required TResult Function(EventSourceStateFailure value) failure,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourceStateInitial value)? initial,
    TResult? Function(EventSourceStateReady value)? ready,
    TResult? Function(EventSourceStateFailure value)? failure,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourceStateInitial value)? initial,
    TResult Function(EventSourceStateReady value)? ready,
    TResult Function(EventSourceStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class EventSourceStateReady implements EventSourceState {
  factory EventSourceStateReady(final EntryRef entryRef) =
      _$EventSourceStateReady;

  EntryRef get entryRef;
  @JsonKey(ignore: true)
  _$$EventSourceStateReadyCopyWith<_$EventSourceStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventSourceStateFailureCopyWith<$Res> {
  factory _$$EventSourceStateFailureCopyWith(_$EventSourceStateFailure value,
          $Res Function(_$EventSourceStateFailure) then) =
      __$$EventSourceStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace? stackTrace});
}

/// @nodoc
class __$$EventSourceStateFailureCopyWithImpl<$Res>
    extends _$EventSourceStateCopyWithImpl<$Res, _$EventSourceStateFailure>
    implements _$$EventSourceStateFailureCopyWith<$Res> {
  __$$EventSourceStateFailureCopyWithImpl(_$EventSourceStateFailure _value,
      $Res Function(_$EventSourceStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = freezed,
  }) {
    return _then(_$EventSourceStateFailure(
      null == error ? _value.error : error,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$EventSourceStateFailure implements EventSourceStateFailure {
  _$EventSourceStateFailure(this.error, [this.stackTrace]);

  @override
  final Object error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'EventSourceState.failure(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSourceStateFailure &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSourceStateFailureCopyWith<_$EventSourceStateFailure> get copyWith =>
      __$$EventSourceStateFailureCopyWithImpl<_$EventSourceStateFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EntryRef headEntryRef) initial,
    required TResult Function(EntryRef entryRef) ready,
    required TResult Function(Object error, StackTrace? stackTrace) failure,
  }) {
    return failure(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EntryRef headEntryRef)? initial,
    TResult? Function(EntryRef entryRef)? ready,
    TResult? Function(Object error, StackTrace? stackTrace)? failure,
  }) {
    return failure?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EntryRef headEntryRef)? initial,
    TResult Function(EntryRef entryRef)? ready,
    TResult Function(Object error, StackTrace? stackTrace)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventSourceStateInitial value) initial,
    required TResult Function(EventSourceStateReady value) ready,
    required TResult Function(EventSourceStateFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EventSourceStateInitial value)? initial,
    TResult? Function(EventSourceStateReady value)? ready,
    TResult? Function(EventSourceStateFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventSourceStateInitial value)? initial,
    TResult Function(EventSourceStateReady value)? ready,
    TResult Function(EventSourceStateFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class EventSourceStateFailure implements EventSourceState {
  factory EventSourceStateFailure(final Object error,
      [final StackTrace? stackTrace]) = _$EventSourceStateFailure;

  Object get error;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$EventSourceStateFailureCopyWith<_$EventSourceStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
