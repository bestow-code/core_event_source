import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core_event_source/event_sourced_behavior.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entry.dart';
import '../../../internal.dart';

part 'value_impl.freezed.dart';

class ValueImpl<Event, T> extends BlocBase<ValueState<Event, T>>
    with Value<Event, T> {
  final ValueHandler<Event, T> valueHandler;
  final void Function(Object error, StackTrace stackTrace) _onError;

  late StreamSubscription subscription;

  factory ValueImpl.initial(
    EntryRef root,
    T value,
    ValueHandler<Event, T> valueHandler, {
    required void Function(Object error, StackTrace stackTrace) onError,
  }) =>
      ValueImpl(ValueState.initial(root, value), valueHandler,
          onError: onError);

  ValueImpl(
    super.state,
    this.valueHandler, {
    required void Function(Object error, StackTrace stackTrace) onError,
  }) : _onError = onError {
    emit(state);
  }

  @override
  T get current => state.value;

  @override
  BlocBase<T> get source => _stateStreamableSource;

  void start() {
    _stateStreamableSource.start();
    subscription = stream.listen(emit);
  }

  late final _ValueStreamableSource<T> _stateStreamableSource =
      _ValueStreamableSource(
          current, stream.map((valueState) => valueState.value));

  @override
  void apply(HeadEffect<Event> effect) =>
      emit(state.apply(effect, valueHandler));

  @override
  @protected
  @mustCallSuper
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    _onError(error, stackTrace);
  }

  @override
  Future<void> close() async {
    await subscription.cancel();
    await _stateStreamableSource.close();
    await super.close();
  }
}

@freezed
class ValueState<Event, T> with _$ValueState<Event, T> {
  const ValueState._();

  factory ValueState.initial(EntryRef root, T empty) =>
      ValueState(root, {root: empty});

  factory ValueState(
    EntryRef head,
    Map<EntryRef, T> values,
  ) = _ValueImpl<Event, T>;

  T get value => values[head]!;

  ValueState<Event, T> apply(
      HeadEffect<Event> effect, ValueHandler<Event, T> valueHandler) {
    return effect.map(append: (append) {
      final entry = append.entry;
      return copyWith(
          head: entry.ref,
          values: Map.of(values)
            ..[entry.ref] =
                _applyEvents(value, append.entry.events, valueHandler));
    }, forward: (forward) {
      final nextValues = Map.of(values);
      forward.entries.fold(value, (previousValue, element) {
        final next = _applyEvents(previousValue, element.events, valueHandler);
        nextValues[element.ref] = next;
        return next;
      });
      return copyWith(head: forward.entries.last.ref, values: nextValues);
    }, merge: (merge) {
      final nextValues = Map.of(values);
      nextValues.removeWhere((key, value) => !merge.base.contains(key));
      final start = values[merge.base.last] as T;

      merge.entries.fold(start, (previousValue, element) {
        final next = _applyEvents(previousValue, element.events, valueHandler);
        nextValues[element.ref] = next;
        return next;
      });
      return copyWith(head: merge.entries.last.ref, values: nextValues);
      // throw UnimplementedError();
    }, reset: (reset) {
      final nextValues = Map.of(values);
      nextValues.removeWhere((key, value) => !reset.base.contains(key));
      final start = values[reset.base.last] as T;

      reset.entries.fold(start, (previousValue, element) {
        final next = _applyEvents(previousValue, element.events, valueHandler);
        nextValues[element.ref] = next;
        return next;
      });
      return copyWith(head: reset.entries.last.ref, values: nextValues);
    }, none: (none) {
      return this;
    });
  }

  T _applyEvents(
      T previous, Iterable<Event> events, ValueHandler<Event, T> valueHandler) {
    return events.fold(
        previous, (previous, event) => valueHandler(previous, event));
  }
}

class _ValueStreamableSource<T> extends BlocBase<T> {
  final Stream<T> _stream;

  late StreamSubscription<T> subscription;

  _ValueStreamableSource(super.state, Stream<T> stream) : _stream = stream;

  void start() {
    subscription = _stream.listen((v) {
      emit(v);
    });
  }

  @override
  Future<void> close() async {
    await subscription.cancel();
    await super.close();
  }
}
