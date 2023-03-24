// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_ref_effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainRefEffect<Event> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(EntryRef previous, EntryRef next) forward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(EntryRef previous, EntryRef next)? forward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(EntryRef previous, EntryRef next)? forward,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainRefEffectNone<Event> value) none,
    required TResult Function(MainRefEffectForward<Event> value) forward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainRefEffectNone<Event> value)? none,
    TResult? Function(MainRefEffectForward<Event> value)? forward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainRefEffectNone<Event> value)? none,
    TResult Function(MainRefEffectForward<Event> value)? forward,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainRefEffectCopyWith<Event, $Res> {
  factory $MainRefEffectCopyWith(MainRefEffect<Event> value,
          $Res Function(MainRefEffect<Event>) then) =
      _$MainRefEffectCopyWithImpl<Event, $Res, MainRefEffect<Event>>;
}

/// @nodoc
class _$MainRefEffectCopyWithImpl<Event, $Res,
        $Val extends MainRefEffect<Event>>
    implements $MainRefEffectCopyWith<Event, $Res> {
  _$MainRefEffectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MainRefEffectNoneCopyWith<Event, $Res> {
  factory _$$MainRefEffectNoneCopyWith(_$MainRefEffectNone<Event> value,
          $Res Function(_$MainRefEffectNone<Event>) then) =
      __$$MainRefEffectNoneCopyWithImpl<Event, $Res>;
}

/// @nodoc
class __$$MainRefEffectNoneCopyWithImpl<Event, $Res>
    extends _$MainRefEffectCopyWithImpl<Event, $Res, _$MainRefEffectNone<Event>>
    implements _$$MainRefEffectNoneCopyWith<Event, $Res> {
  __$$MainRefEffectNoneCopyWithImpl(_$MainRefEffectNone<Event> _value,
      $Res Function(_$MainRefEffectNone<Event>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MainRefEffectNone<Event> implements MainRefEffectNone<Event> {
  _$MainRefEffectNone();

  @override
  String toString() {
    return 'MainRefEffect<$Event>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainRefEffectNone<Event>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(EntryRef previous, EntryRef next) forward,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(EntryRef previous, EntryRef next)? forward,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(EntryRef previous, EntryRef next)? forward,
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
    required TResult Function(MainRefEffectNone<Event> value) none,
    required TResult Function(MainRefEffectForward<Event> value) forward,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainRefEffectNone<Event> value)? none,
    TResult? Function(MainRefEffectForward<Event> value)? forward,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainRefEffectNone<Event> value)? none,
    TResult Function(MainRefEffectForward<Event> value)? forward,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class MainRefEffectNone<Event> implements MainRefEffect<Event> {
  factory MainRefEffectNone() = _$MainRefEffectNone<Event>;
}

/// @nodoc
abstract class _$$MainRefEffectForwardCopyWith<Event, $Res> {
  factory _$$MainRefEffectForwardCopyWith(_$MainRefEffectForward<Event> value,
          $Res Function(_$MainRefEffectForward<Event>) then) =
      __$$MainRefEffectForwardCopyWithImpl<Event, $Res>;
  @useResult
  $Res call({EntryRef previous, EntryRef next});

  $EntryRefCopyWith<$Res> get previous;
  $EntryRefCopyWith<$Res> get next;
}

/// @nodoc
class __$$MainRefEffectForwardCopyWithImpl<Event, $Res>
    extends _$MainRefEffectCopyWithImpl<Event, $Res,
        _$MainRefEffectForward<Event>>
    implements _$$MainRefEffectForwardCopyWith<Event, $Res> {
  __$$MainRefEffectForwardCopyWithImpl(_$MainRefEffectForward<Event> _value,
      $Res Function(_$MainRefEffectForward<Event>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previous = null,
    Object? next = null,
  }) {
    return _then(_$MainRefEffectForward<Event>(
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as EntryRef,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get previous {
    return $EntryRefCopyWith<$Res>(_value.previous, (value) {
      return _then(_value.copyWith(previous: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get next {
    return $EntryRefCopyWith<$Res>(_value.next, (value) {
      return _then(_value.copyWith(next: value));
    });
  }
}

/// @nodoc

class _$MainRefEffectForward<Event> implements MainRefEffectForward<Event> {
  _$MainRefEffectForward({required this.previous, required this.next});

  @override
  final EntryRef previous;
  @override
  final EntryRef next;

  @override
  String toString() {
    return 'MainRefEffect<$Event>.forward(previous: $previous, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainRefEffectForward<Event> &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.next, next) || other.next == next));
  }

  @override
  int get hashCode => Object.hash(runtimeType, previous, next);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainRefEffectForwardCopyWith<Event, _$MainRefEffectForward<Event>>
      get copyWith => __$$MainRefEffectForwardCopyWithImpl<Event,
          _$MainRefEffectForward<Event>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(EntryRef previous, EntryRef next) forward,
  }) {
    return forward(previous, next);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(EntryRef previous, EntryRef next)? forward,
  }) {
    return forward?.call(previous, next);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(EntryRef previous, EntryRef next)? forward,
    required TResult orElse(),
  }) {
    if (forward != null) {
      return forward(previous, next);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainRefEffectNone<Event> value) none,
    required TResult Function(MainRefEffectForward<Event> value) forward,
  }) {
    return forward(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainRefEffectNone<Event> value)? none,
    TResult? Function(MainRefEffectForward<Event> value)? forward,
  }) {
    return forward?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainRefEffectNone<Event> value)? none,
    TResult Function(MainRefEffectForward<Event> value)? forward,
    required TResult orElse(),
  }) {
    if (forward != null) {
      return forward(this);
    }
    return orElse();
  }
}

abstract class MainRefEffectForward<Event> implements MainRefEffect<Event> {
  factory MainRefEffectForward(
      {required final EntryRef previous,
      required final EntryRef next}) = _$MainRefEffectForward<Event>;

  EntryRef get previous;
  EntryRef get next;
  @JsonKey(ignore: true)
  _$$MainRefEffectForwardCopyWith<Event, _$MainRefEffectForward<Event>>
      get copyWith => throw _privateConstructorUsedError;
}
