// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueState<Event, T> {
  EntryRef get head => throw _privateConstructorUsedError;
  Map<EntryRef, T> get values => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueStateCopyWith<Event, T, ValueState<Event, T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueStateCopyWith<Event, T, $Res> {
  factory $ValueStateCopyWith(ValueState<Event, T> value,
          $Res Function(ValueState<Event, T>) then) =
      _$ValueStateCopyWithImpl<Event, T, $Res, ValueState<Event, T>>;
  @useResult
  $Res call({EntryRef head, Map<EntryRef, T> values});

  $EntryRefCopyWith<$Res> get head;
}

/// @nodoc
class _$ValueStateCopyWithImpl<Event, T, $Res,
        $Val extends ValueState<Event, T>>
    implements $ValueStateCopyWith<Event, T, $Res> {
  _$ValueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? head = null,
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      head: null == head
          ? _value.head
          : head // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<EntryRef, T>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get head {
    return $EntryRefCopyWith<$Res>(_value.head, (value) {
      return _then(_value.copyWith(head: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ValueImplCopyWith<Event, T, $Res>
    implements $ValueStateCopyWith<Event, T, $Res> {
  factory _$$_ValueImplCopyWith(_$_ValueImpl<Event, T> value,
          $Res Function(_$_ValueImpl<Event, T>) then) =
      __$$_ValueImplCopyWithImpl<Event, T, $Res>;
  @override
  @useResult
  $Res call({EntryRef head, Map<EntryRef, T> values});

  @override
  $EntryRefCopyWith<$Res> get head;
}

/// @nodoc
class __$$_ValueImplCopyWithImpl<Event, T, $Res>
    extends _$ValueStateCopyWithImpl<Event, T, $Res, _$_ValueImpl<Event, T>>
    implements _$$_ValueImplCopyWith<Event, T, $Res> {
  __$$_ValueImplCopyWithImpl(_$_ValueImpl<Event, T> _value,
      $Res Function(_$_ValueImpl<Event, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? head = null,
    Object? values = null,
  }) {
    return _then(_$_ValueImpl<Event, T>(
      null == head
          ? _value.head
          : head // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<EntryRef, T>,
    ));
  }
}

/// @nodoc

class _$_ValueImpl<Event, T> extends _ValueImpl<Event, T> {
  _$_ValueImpl(this.head, final Map<EntryRef, T> values)
      : _values = values,
        super._();

  @override
  final EntryRef head;
  final Map<EntryRef, T> _values;
  @override
  Map<EntryRef, T> get values {
    if (_values is EqualUnmodifiableMapView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_values);
  }

  @override
  String toString() {
    return 'ValueState<$Event, $T>(head: $head, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValueImpl<Event, T> &&
            (identical(other.head, head) || other.head == head) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, head, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValueImplCopyWith<Event, T, _$_ValueImpl<Event, T>> get copyWith =>
      __$$_ValueImplCopyWithImpl<Event, T, _$_ValueImpl<Event, T>>(
          this, _$identity);
}

abstract class _ValueImpl<Event, T> extends ValueState<Event, T> {
  factory _ValueImpl(final EntryRef head, final Map<EntryRef, T> values) =
      _$_ValueImpl<Event, T>;
  _ValueImpl._() : super._();

  @override
  EntryRef get head;
  @override
  Map<EntryRef, T> get values;
  @override
  @JsonKey(ignore: true)
  _$$_ValueImplCopyWith<Event, T, _$_ValueImpl<Event, T>> get copyWith =>
      throw _privateConstructorUsedError;
}
