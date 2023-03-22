// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Entry<Event> {
  EntryRef get ref => throw _privateConstructorUsedError;
  Iterable<EntryRef> get refs => throw _privateConstructorUsedError;
  Iterable<Event> get events => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntryCopyWith<Event, Entry<Event>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<Event, $Res> {
  factory $EntryCopyWith(Entry<Event> value, $Res Function(Entry<Event>) then) =
      _$EntryCopyWithImpl<Event, $Res, Entry<Event>>;
  @useResult
  $Res call(
      {EntryRef ref,
      Iterable<EntryRef> refs,
      Iterable<Event> events,
      @DateTimeConverter() DateTime createdAt});

  $EntryRefCopyWith<$Res> get ref;
}

/// @nodoc
class _$EntryCopyWithImpl<Event, $Res, $Val extends Entry<Event>>
    implements $EntryCopyWith<Event, $Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? refs = null,
    Object? events = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      refs: null == refs
          ? _value.refs
          : refs // ignore: cast_nullable_to_non_nullable
              as Iterable<EntryRef>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as Iterable<Event>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get ref {
    return $EntryRefCopyWith<$Res>(_value.ref, (value) {
      return _then(_value.copyWith(ref: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EntryCopyWith<Event, $Res>
    implements $EntryCopyWith<Event, $Res> {
  factory _$$_EntryCopyWith(
          _$_Entry<Event> value, $Res Function(_$_Entry<Event>) then) =
      __$$_EntryCopyWithImpl<Event, $Res>;
  @override
  @useResult
  $Res call(
      {EntryRef ref,
      Iterable<EntryRef> refs,
      Iterable<Event> events,
      @DateTimeConverter() DateTime createdAt});

  @override
  $EntryRefCopyWith<$Res> get ref;
}

/// @nodoc
class __$$_EntryCopyWithImpl<Event, $Res>
    extends _$EntryCopyWithImpl<Event, $Res, _$_Entry<Event>>
    implements _$$_EntryCopyWith<Event, $Res> {
  __$$_EntryCopyWithImpl(
      _$_Entry<Event> _value, $Res Function(_$_Entry<Event>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref = null,
    Object? refs = null,
    Object? events = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Entry<Event>(
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      refs: null == refs
          ? _value.refs
          : refs // ignore: cast_nullable_to_non_nullable
              as Iterable<EntryRef>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as Iterable<Event>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Entry<Event> extends _Entry<Event> {
  _$_Entry(
      {required this.ref,
      required this.refs,
      required this.events,
      @DateTimeConverter() required this.createdAt})
      : super._();

  @override
  final EntryRef ref;
  @override
  final Iterable<EntryRef> refs;
  @override
  final Iterable<Event> events;
  @override
  @DateTimeConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'Entry<$Event>(ref: $ref, refs: $refs, events: $events, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Entry<Event> &&
            (identical(other.ref, ref) || other.ref == ref) &&
            const DeepCollectionEquality().equals(other.refs, refs) &&
            const DeepCollectionEquality().equals(other.events, events) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      ref,
      const DeepCollectionEquality().hash(refs),
      const DeepCollectionEquality().hash(events),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntryCopyWith<Event, _$_Entry<Event>> get copyWith =>
      __$$_EntryCopyWithImpl<Event, _$_Entry<Event>>(this, _$identity);
}

abstract class _Entry<Event> extends Entry<Event> {
  factory _Entry(
          {required final EntryRef ref,
          required final Iterable<EntryRef> refs,
          required final Iterable<Event> events,
          @DateTimeConverter() required final DateTime createdAt}) =
      _$_Entry<Event>;
  _Entry._() : super._();

  @override
  EntryRef get ref;
  @override
  Iterable<EntryRef> get refs;
  @override
  Iterable<Event> get events;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_EntryCopyWith<Event, _$_Entry<Event>> get copyWith =>
      throw _privateConstructorUsedError;
}
