import 'package:bloc/bloc.dart';
import 'package:core_event_source/internal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../entry.dart';

part 'head_effect_dispatcher.freezed.dart';

@freezed
class HeadEffect<Event> with _$HeadEffect<Event> {
  factory HeadEffect.append(EntryRef start, Entry<Event> entry) =
      HeadEffectAppend<Event>;

  @Assert('entries.isNotEmpty')
  factory HeadEffect.forward(EntryRef start, Iterable<Entry<Event>> entries) =
      HeadEffectForward<Event>;

  @Assert('entries.isNotEmpty')
  factory HeadEffect.reset(EntryRef start, Iterable<EntryRef> base,
      Iterable<Entry<Event>> entries) = HeadEffectReset<Event>;

  factory HeadEffect.none() = HeadEffectNone;
}

mixin HeadEffectHandler<Event> {
  void apply(HeadEffect<Event> effect);
}

abstract class HeadEffectDispatcher<Event>
    implements BlocBase<HeadEffect<Event>> {
  Future<void> dispatch(HeadEffect<Event> effect);

  @mustCallSuper
  void propagate(Object error, [StackTrace? stackTrace]);
}

class HeadEffectDispatcherImpl<Event> extends BlocBase<HeadEffect<Event>>
    implements HeadEffectDispatcher<Event> {
  late final Journal<Event> _journal;
  final List<HeadEffectHandler<Event>> _handlers = [];
  late final void Function(Object error, [StackTrace? stackTrace]) _onError;

  HeadEffectDispatcherImpl() : super(HeadEffect.none());

  @mustCallSuper
  @override
  void propagate(Object error, [StackTrace? stackTrace]) {
    super.addError(error, stackTrace);
    _onError(error, stackTrace);
  }

  void registerErrorHandler(
          void Function(Object error, [StackTrace? stackTrace]) onError) =>
      _onError = onError;

  void registerJournal(Journal<Event> journal) => _journal = journal;

  void registerHandler(HeadEffectHandler<Event> handler) =>
      _handlers.add(handler);

  @override
  Future<void> dispatch(HeadEffect<Event> effect) async {
    for (final handler in _handlers) {
      handler.apply(effect);
    }
    await _journal.apply(effect);
    emit(effect);
  }
}
