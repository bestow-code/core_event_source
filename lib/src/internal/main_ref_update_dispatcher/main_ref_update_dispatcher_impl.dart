import 'package:bloc/bloc.dart';
import 'package:core_event_source/entry.dart';
import 'package:core_event_source/internal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_ref_update_dispatcher_impl.freezed.dart';

class MainRefUpdateDispatcherImpl
    extends Bloc<MainRefUpdateDispatcherEvent, MainRefUpdateDispatcherState> {
  final Journal _journal;

  final Stream<EventSourceState> _headSource;
  final EntryCollection _entryCollection;

  MainRefUpdateDispatcherImpl(super.initialState, this._journal,
      this._headSource, this._entryCollection) {
    _entryCollection.updates.stream.listen((_) {
      _check(state.head);
    });
    _headSource.listen((event) {
      event.mapOrNull(ready: (ready) => _check(ready.entryRef));
    });
  }

  void _check(EntryRef headRef) async {
    final effect = _entryCollection.buildMainRefEffect(headRef);
    await _journal.applyMainRefEffect(effect);
  }
}

@freezed
class MainRefUpdateDispatcherEvent with _$MainRefUpdateDispatcherEvent {
  factory MainRefUpdateDispatcherEvent.headRefUpdate(
      {required EntryRef entryRef}) = MainRefUpdateDispatcherEventHeadRefUpdate;
}

@freezed
class MainRefUpdateDispatcherState with _$MainRefUpdateDispatcherState {
  factory MainRefUpdateDispatcherState({
    required EntryRef head,
    required EntryRef main,
  }) = _MainRefUpdateDispatcherState;
}
