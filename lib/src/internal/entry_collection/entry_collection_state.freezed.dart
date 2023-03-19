// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_collection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EntryCollectionState<Event> {
  EntryRef get mainEntryRef => throw _privateConstructorUsedError;
  Map<EntryRef, Entry<Event>> get entries => throw _privateConstructorUsedError;
  DirectedGraph<Entry<Event>> get graph => throw _privateConstructorUsedError;
  Set<EntryRef> get pending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntryCollectionStateCopyWith<Event, EntryCollectionState<Event>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCollectionStateCopyWith<Event, $Res> {
  factory $EntryCollectionStateCopyWith(EntryCollectionState<Event> value,
          $Res Function(EntryCollectionState<Event>) then) =
      _$EntryCollectionStateCopyWithImpl<Event, $Res,
          EntryCollectionState<Event>>;
  @useResult
  $Res call(
      {EntryRef mainEntryRef,
      Map<EntryRef, Entry<Event>> entries,
      DirectedGraph<Entry<Event>> graph,
      Set<EntryRef> pending});

  $EntryRefCopyWith<$Res> get mainEntryRef;
}

/// @nodoc
class _$EntryCollectionStateCopyWithImpl<Event, $Res,
        $Val extends EntryCollectionState<Event>>
    implements $EntryCollectionStateCopyWith<Event, $Res> {
  _$EntryCollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainEntryRef = null,
    Object? entries = null,
    Object? graph = null,
    Object? pending = null,
  }) {
    return _then(_value.copyWith(
      mainEntryRef: null == mainEntryRef
          ? _value.mainEntryRef
          : mainEntryRef // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as Map<EntryRef, Entry<Event>>,
      graph: null == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as DirectedGraph<Entry<Event>>,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as Set<EntryRef>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EntryRefCopyWith<$Res> get mainEntryRef {
    return $EntryRefCopyWith<$Res>(_value.mainEntryRef, (value) {
      return _then(_value.copyWith(mainEntryRef: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EntryCollectionStateCopyWith<Event, $Res>
    implements $EntryCollectionStateCopyWith<Event, $Res> {
  factory _$$_EntryCollectionStateCopyWith(_$_EntryCollectionState<Event> value,
          $Res Function(_$_EntryCollectionState<Event>) then) =
      __$$_EntryCollectionStateCopyWithImpl<Event, $Res>;
  @override
  @useResult
  $Res call(
      {EntryRef mainEntryRef,
      Map<EntryRef, Entry<Event>> entries,
      DirectedGraph<Entry<Event>> graph,
      Set<EntryRef> pending});

  @override
  $EntryRefCopyWith<$Res> get mainEntryRef;
}

/// @nodoc
class __$$_EntryCollectionStateCopyWithImpl<Event, $Res>
    extends _$EntryCollectionStateCopyWithImpl<Event, $Res,
        _$_EntryCollectionState<Event>>
    implements _$$_EntryCollectionStateCopyWith<Event, $Res> {
  __$$_EntryCollectionStateCopyWithImpl(_$_EntryCollectionState<Event> _value,
      $Res Function(_$_EntryCollectionState<Event>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainEntryRef = null,
    Object? entries = null,
    Object? graph = null,
    Object? pending = null,
  }) {
    return _then(_$_EntryCollectionState<Event>(
      mainEntryRef: null == mainEntryRef
          ? _value.mainEntryRef
          : mainEntryRef // ignore: cast_nullable_to_non_nullable
              as EntryRef,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as Map<EntryRef, Entry<Event>>,
      graph: null == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as DirectedGraph<Entry<Event>>,
      pending: null == pending
          ? _value._pending
          : pending // ignore: cast_nullable_to_non_nullable
              as Set<EntryRef>,
    ));
  }
}

/// @nodoc

class _$_EntryCollectionState<Event> extends _EntryCollectionState<Event> {
  _$_EntryCollectionState(
      {required this.mainEntryRef,
      required final Map<EntryRef, Entry<Event>> entries,
      required this.graph,
      required final Set<EntryRef> pending})
      : _entries = entries,
        _pending = pending,
        super._();

  @override
  final EntryRef mainEntryRef;
  final Map<EntryRef, Entry<Event>> _entries;
  @override
  Map<EntryRef, Entry<Event>> get entries {
    if (_entries is EqualUnmodifiableMapView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_entries);
  }

  @override
  final DirectedGraph<Entry<Event>> graph;
  final Set<EntryRef> _pending;
  @override
  Set<EntryRef> get pending {
    if (_pending is EqualUnmodifiableSetView) return _pending;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_pending);
  }

  @override
  String toString() {
    return 'EntryCollectionState<$Event>(mainEntryRef: $mainEntryRef, entries: $entries, graph: $graph, pending: $pending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntryCollectionState<Event> &&
            (identical(other.mainEntryRef, mainEntryRef) ||
                other.mainEntryRef == mainEntryRef) &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            const DeepCollectionEquality().equals(other.graph, graph) &&
            const DeepCollectionEquality().equals(other._pending, _pending));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mainEntryRef,
      const DeepCollectionEquality().hash(_entries),
      const DeepCollectionEquality().hash(graph),
      const DeepCollectionEquality().hash(_pending));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntryCollectionStateCopyWith<Event, _$_EntryCollectionState<Event>>
      get copyWith => __$$_EntryCollectionStateCopyWithImpl<Event,
          _$_EntryCollectionState<Event>>(this, _$identity);
}

abstract class _EntryCollectionState<Event>
    extends EntryCollectionState<Event> {
  factory _EntryCollectionState(
      {required final EntryRef mainEntryRef,
      required final Map<EntryRef, Entry<Event>> entries,
      required final DirectedGraph<Entry<Event>> graph,
      required final Set<EntryRef> pending}) = _$_EntryCollectionState<Event>;
  _EntryCollectionState._() : super._();

  @override
  EntryRef get mainEntryRef;
  @override
  Map<EntryRef, Entry<Event>> get entries;
  @override
  DirectedGraph<Entry<Event>> get graph;
  @override
  Set<EntryRef> get pending;
  @override
  @JsonKey(ignore: true)
  _$$_EntryCollectionStateCopyWith<Event, _$_EntryCollectionState<Event>>
      get copyWith => throw _privateConstructorUsedError;
}
