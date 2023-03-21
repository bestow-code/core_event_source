import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:core_event_source/entry.dart';
import 'package:core_event_source/internal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common.dart';

part 'main_ref_update_dispatcher_impl.freezed.dart';

class MainRefUpdateDispatcherImpl<Command, Event, State>
    extends Bloc<MainRefUpdateDispatcherEvent, MainRefEffect<Event>> {
  final Journal<Event> _journal;
  final EventSourceInternal<Command, Event, State> _source;
  final EntryCollection<Event> _entryCollection;

  MainRefUpdateDispatcherImpl(
      super.initialState, this._journal, this._source, this._entryCollection) {
    on<MainRefUpdateDispatcherEventUpdate>((event, emit) async {
      _source.state.mapOrNull(ready: (ready) async {
        final effect = _entryCollection.buildMainRefEffect(ready.entryRef);
        emit(effect);
      });
    }, transformer: restartable());
    _entryCollection.stream.listen((_) {
      add(MainRefUpdateDispatcherEvent.update());
    });
    _source.stream.listen((event) {
      event.mapOrNull(ready: (ready) {
        add(MainRefUpdateDispatcherEvent.update());
      });
    });
    stream.listen((effect) async {
      await _journal.applyMainRefEffect(effect);
    });
  }
}

@freezed
class MainRefUpdateDispatcherEvent with _$MainRefUpdateDispatcherEvent {
  factory MainRefUpdateDispatcherEvent.update() =
      MainRefUpdateDispatcherEventUpdate;
}

@freezed
class MainRefUpdateDispatcherState with _$MainRefUpdateDispatcherState {
  factory MainRefUpdateDispatcherState({
    required EntryRef head,
    required EntryRef main,
  }) = _MainRefUpdateDispatcherState;
}
