// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'head_effect_dispatcher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HeadEffect<Event> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EntryRef start, Entry<Event> entry) append,
    required TResult Function(EntryRef start, Iterable<Entry<Event>> entries)
        forward,
    required TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)
        reset,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EntryRef start, Entry<Event> entry)? append,
    TResult? Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult? Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EntryRef start, Entry<Event> entry)? append,
    TResult Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeadEffectAppend<Event> value) append,
    required TResult Function(HeadEffectForward<Event> value) forward,
    required TResult Function(HeadEffectReset<Event> value) reset,
    required TResult Function(HeadEffectNone<Event> value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeadEffectAppend<Event> value)? append,
    TResult? Function(HeadEffectForward<Event> value)? forward,
    TResult? Function(HeadEffectReset<Event> value)? reset,
    TResult? Function(HeadEffectNone<Event> value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeadEffectAppend<Event> value)? append,
    TResult Function(HeadEffectForward<Event> value)? forward,
    TResult Function(HeadEffectReset<Event> value)? reset,
    TResult Function(HeadEffectNone<Event> value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeadEffectCopyWith<Event, $Res> {
  factory $HeadEffectCopyWith(
          HeadEffect<Event> value, $Res Function(HeadEffect<Event>) then) =
      _$HeadEffectCopyWithImpl<Event, $Res, HeadEffect<Event>>;
}

/// @nodoc
class _$HeadEffectCopyWithImpl<Event, $Res, $Val extends HeadEffect<Event>>
    implements $HeadEffectCopyWith<Event, $Res> {
  _$HeadEffectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HeadEffectAppendCopyWith<Event, $Res> {
  factory _$$HeadEffectAppendCopyWith(_$HeadEffectAppend<Event> value,
          $Res Function(_$HeadEffectAppend<Event>) then) =
      __$$HeadEffectAppendCopyWithImpl<Event, $Res>;
  @useResult
  $Res call({EntryRef start, Entry<Event> entry});

  $EntryRefCopyWith<$Res> get start;
  $EntryCopyWith<Event, $Res> get entry;
}

/// @nodoc
class __$$HeadEffectAppendCopyWithImpl<Event, $Res>
    extends _$HeadEffectCopyWithImpl<Event, $Res, _$HeadEffectAppend<Event>>
    implements _$$HeadEffectAppendCopyWith<Event, $Res> {
  __$$HeadEffectAppendCopyWithImpl(_$HeadEffectAppend<Event> _value,
      $Res Function(_$HeadEffectAppend<Event>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? entry = null,
  }) {
    return _then(_$HeadEffectAppend<Event>(
      null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as Entry<Event>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get start {
    return $EntryRefCopyWith<$Res>(_value.start, (value) {
      return _then(_value.copyWith(start: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryCopyWith<Event, $Res> get entry {
    return $EntryCopyWith<Event, $Res>(_value.entry, (value) {
      return _then(_value.copyWith(entry: value));
    });
  }
}

/// @nodoc

class _$HeadEffectAppend<Event> implements HeadEffectAppend<Event> {
  _$HeadEffectAppend(this.start, this.entry);

  @override
  final EntryRef start;
  @override
  final Entry<Event> entry;

  @override
  String toString() {
    return 'HeadEffect<$Event>.append(start: $start, entry: $entry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeadEffectAppend<Event> &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, entry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeadEffectAppendCopyWith<Event, _$HeadEffectAppend<Event>> get copyWith =>
      __$$HeadEffectAppendCopyWithImpl<Event, _$HeadEffectAppend<Event>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EntryRef start, Entry<Event> entry) append,
    required TResult Function(EntryRef start, Iterable<Entry<Event>> entries)
        forward,
    required TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)
        reset,
    required TResult Function() none,
  }) {
    return append(start, entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EntryRef start, Entry<Event> entry)? append,
    TResult? Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult? Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult? Function()? none,
  }) {
    return append?.call(start, entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EntryRef start, Entry<Event> entry)? append,
    TResult Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (append != null) {
      return append(start, entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeadEffectAppend<Event> value) append,
    required TResult Function(HeadEffectForward<Event> value) forward,
    required TResult Function(HeadEffectReset<Event> value) reset,
    required TResult Function(HeadEffectNone<Event> value) none,
  }) {
    return append(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeadEffectAppend<Event> value)? append,
    TResult? Function(HeadEffectForward<Event> value)? forward,
    TResult? Function(HeadEffectReset<Event> value)? reset,
    TResult? Function(HeadEffectNone<Event> value)? none,
  }) {
    return append?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeadEffectAppend<Event> value)? append,
    TResult Function(HeadEffectForward<Event> value)? forward,
    TResult Function(HeadEffectReset<Event> value)? reset,
    TResult Function(HeadEffectNone<Event> value)? none,
    required TResult orElse(),
  }) {
    if (append != null) {
      return append(this);
    }
    return orElse();
  }
}

abstract class HeadEffectAppend<Event> implements HeadEffect<Event> {
  factory HeadEffectAppend(final EntryRef start, final Entry<Event> entry) =
      _$HeadEffectAppend<Event>;

  EntryRef get start;
  Entry<Event> get entry;
  @JsonKey(ignore: true)
  _$$HeadEffectAppendCopyWith<Event, _$HeadEffectAppend<Event>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HeadEffectForwardCopyWith<Event, $Res> {
  factory _$$HeadEffectForwardCopyWith(_$HeadEffectForward<Event> value,
          $Res Function(_$HeadEffectForward<Event>) then) =
      __$$HeadEffectForwardCopyWithImpl<Event, $Res>;
  @useResult
  $Res call({EntryRef start, Iterable<Entry<Event>> entries});

  $EntryRefCopyWith<$Res> get start;
}

/// @nodoc
class __$$HeadEffectForwardCopyWithImpl<Event, $Res>
    extends _$HeadEffectCopyWithImpl<Event, $Res, _$HeadEffectForward<Event>>
    implements _$$HeadEffectForwardCopyWith<Event, $Res> {
  __$$HeadEffectForwardCopyWithImpl(_$HeadEffectForward<Event> _value,
      $Res Function(_$HeadEffectForward<Event>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? entries = null,
  }) {
    return _then(_$HeadEffectForward<Event>(
      null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as Iterable<Entry<Event>>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get start {
    return $EntryRefCopyWith<$Res>(_value.start, (value) {
      return _then(_value.copyWith(start: value));
    });
  }
}

/// @nodoc

class _$HeadEffectForward<Event> implements HeadEffectForward<Event> {
  _$HeadEffectForward(this.start, this.entries) : assert(entries.isNotEmpty);

  @override
  final EntryRef start;
  @override
  final Iterable<Entry<Event>> entries;

  @override
  String toString() {
    return 'HeadEffect<$Event>.forward(start: $start, entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeadEffectForward<Event> &&
            (identical(other.start, start) || other.start == start) &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, start, const DeepCollectionEquality().hash(entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeadEffectForwardCopyWith<Event, _$HeadEffectForward<Event>>
      get copyWith =>
          __$$HeadEffectForwardCopyWithImpl<Event, _$HeadEffectForward<Event>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EntryRef start, Entry<Event> entry) append,
    required TResult Function(EntryRef start, Iterable<Entry<Event>> entries)
        forward,
    required TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)
        reset,
    required TResult Function() none,
  }) {
    return forward(start, entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EntryRef start, Entry<Event> entry)? append,
    TResult? Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult? Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult? Function()? none,
  }) {
    return forward?.call(start, entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EntryRef start, Entry<Event> entry)? append,
    TResult Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (forward != null) {
      return forward(start, entries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeadEffectAppend<Event> value) append,
    required TResult Function(HeadEffectForward<Event> value) forward,
    required TResult Function(HeadEffectReset<Event> value) reset,
    required TResult Function(HeadEffectNone<Event> value) none,
  }) {
    return forward(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeadEffectAppend<Event> value)? append,
    TResult? Function(HeadEffectForward<Event> value)? forward,
    TResult? Function(HeadEffectReset<Event> value)? reset,
    TResult? Function(HeadEffectNone<Event> value)? none,
  }) {
    return forward?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeadEffectAppend<Event> value)? append,
    TResult Function(HeadEffectForward<Event> value)? forward,
    TResult Function(HeadEffectReset<Event> value)? reset,
    TResult Function(HeadEffectNone<Event> value)? none,
    required TResult orElse(),
  }) {
    if (forward != null) {
      return forward(this);
    }
    return orElse();
  }
}

abstract class HeadEffectForward<Event> implements HeadEffect<Event> {
  factory HeadEffectForward(
          final EntryRef start, final Iterable<Entry<Event>> entries) =
      _$HeadEffectForward<Event>;

  EntryRef get start;
  Iterable<Entry<Event>> get entries;
  @JsonKey(ignore: true)
  _$$HeadEffectForwardCopyWith<Event, _$HeadEffectForward<Event>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HeadEffectResetCopyWith<Event, $Res> {
  factory _$$HeadEffectResetCopyWith(_$HeadEffectReset<Event> value,
          $Res Function(_$HeadEffectReset<Event>) then) =
      __$$HeadEffectResetCopyWithImpl<Event, $Res>;
  @useResult
  $Res call(
      {EntryRef start,
      Iterable<EntryRef> base,
      Iterable<Entry<Event>> entries});

  $EntryRefCopyWith<$Res> get start;
}

/// @nodoc
class __$$HeadEffectResetCopyWithImpl<Event, $Res>
    extends _$HeadEffectCopyWithImpl<Event, $Res, _$HeadEffectReset<Event>>
    implements _$$HeadEffectResetCopyWith<Event, $Res> {
  __$$HeadEffectResetCopyWithImpl(_$HeadEffectReset<Event> _value,
      $Res Function(_$HeadEffectReset<Event>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? base = null,
    Object? entries = null,
  }) {
    return _then(_$HeadEffectReset<Event>(
      null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Iterable<EntryRef>,
      null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as Iterable<Entry<Event>>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get start {
    return $EntryRefCopyWith<$Res>(_value.start, (value) {
      return _then(_value.copyWith(start: value));
    });
  }
}

/// @nodoc

class _$HeadEffectReset<Event> implements HeadEffectReset<Event> {
  _$HeadEffectReset(this.start, this.base, this.entries)
      : assert(entries.isNotEmpty);

  @override
  final EntryRef start;
  @override
  final Iterable<EntryRef> base;
  @override
  final Iterable<Entry<Event>> entries;

  @override
  String toString() {
    return 'HeadEffect<$Event>.reset(start: $start, base: $base, entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeadEffectReset<Event> &&
            (identical(other.start, start) || other.start == start) &&
            const DeepCollectionEquality().equals(other.base, base) &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      start,
      const DeepCollectionEquality().hash(base),
      const DeepCollectionEquality().hash(entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeadEffectResetCopyWith<Event, _$HeadEffectReset<Event>> get copyWith =>
      __$$HeadEffectResetCopyWithImpl<Event, _$HeadEffectReset<Event>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EntryRef start, Entry<Event> entry) append,
    required TResult Function(EntryRef start, Iterable<Entry<Event>> entries)
        forward,
    required TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)
        reset,
    required TResult Function() none,
  }) {
    return reset(start, base, entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EntryRef start, Entry<Event> entry)? append,
    TResult? Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult? Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult? Function()? none,
  }) {
    return reset?.call(start, base, entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EntryRef start, Entry<Event> entry)? append,
    TResult Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(start, base, entries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HeadEffectAppend<Event> value) append,
    required TResult Function(HeadEffectForward<Event> value) forward,
    required TResult Function(HeadEffectReset<Event> value) reset,
    required TResult Function(HeadEffectNone<Event> value) none,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeadEffectAppend<Event> value)? append,
    TResult? Function(HeadEffectForward<Event> value)? forward,
    TResult? Function(HeadEffectReset<Event> value)? reset,
    TResult? Function(HeadEffectNone<Event> value)? none,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeadEffectAppend<Event> value)? append,
    TResult Function(HeadEffectForward<Event> value)? forward,
    TResult Function(HeadEffectReset<Event> value)? reset,
    TResult Function(HeadEffectNone<Event> value)? none,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class HeadEffectReset<Event> implements HeadEffect<Event> {
  factory HeadEffectReset(final EntryRef start, final Iterable<EntryRef> base,
      final Iterable<Entry<Event>> entries) = _$HeadEffectReset<Event>;

  EntryRef get start;
  Iterable<EntryRef> get base;
  Iterable<Entry<Event>> get entries;
  @JsonKey(ignore: true)
  _$$HeadEffectResetCopyWith<Event, _$HeadEffectReset<Event>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HeadEffectNoneCopyWith<Event, $Res> {
  factory _$$HeadEffectNoneCopyWith(_$HeadEffectNone<Event> value,
          $Res Function(_$HeadEffectNone<Event>) then) =
      __$$HeadEffectNoneCopyWithImpl<Event, $Res>;
}

/// @nodoc
class __$$HeadEffectNoneCopyWithImpl<Event, $Res>
    extends _$HeadEffectCopyWithImpl<Event, $Res, _$HeadEffectNone<Event>>
    implements _$$HeadEffectNoneCopyWith<Event, $Res> {
  __$$HeadEffectNoneCopyWithImpl(_$HeadEffectNone<Event> _value,
      $Res Function(_$HeadEffectNone<Event>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HeadEffectNone<Event> implements HeadEffectNone<Event> {
  _$HeadEffectNone();

  @override
  String toString() {
    return 'HeadEffect<$Event>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HeadEffectNone<Event>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EntryRef start, Entry<Event> entry) append,
    required TResult Function(EntryRef start, Iterable<Entry<Event>> entries)
        forward,
    required TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)
        reset,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EntryRef start, Entry<Event> entry)? append,
    TResult? Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult? Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EntryRef start, Entry<Event> entry)? append,
    TResult Function(EntryRef start, Iterable<Entry<Event>> entries)? forward,
    TResult Function(EntryRef start, Iterable<EntryRef> base,
            Iterable<Entry<Event>> entries)?
        reset,
    TResult Function()? none,
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
    required TResult Function(HeadEffectAppend<Event> value) append,
    required TResult Function(HeadEffectForward<Event> value) forward,
    required TResult Function(HeadEffectReset<Event> value) reset,
    required TResult Function(HeadEffectNone<Event> value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HeadEffectAppend<Event> value)? append,
    TResult? Function(HeadEffectForward<Event> value)? forward,
    TResult? Function(HeadEffectReset<Event> value)? reset,
    TResult? Function(HeadEffectNone<Event> value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HeadEffectAppend<Event> value)? append,
    TResult Function(HeadEffectForward<Event> value)? forward,
    TResult Function(HeadEffectReset<Event> value)? reset,
    TResult Function(HeadEffectNone<Event> value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class HeadEffectNone<Event> implements HeadEffect<Event> {
  factory HeadEffectNone() = _$HeadEffectNone<Event>;
}
