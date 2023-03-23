import 'package:bloc/bloc.dart';

import '../../../entry.dart';
import '../../../internal.dart';

abstract class EntryCollection<Event>
    implements HeadEffectHandler<Event>, BlocBase<EntryCollectionState<Event>> {
  BlocBase get updates;

  /// Builds a HeadEffect to model a merge of [headRef] with the current main entry ref
  HeadEffect<Event> buildMergeHeadEffect(
      EntryRef headRef, EntryFactory<Event> entryFactory);

  HeadEffect<Event> buildInitialHeadEffect(EntryRef headRef);

  MainRefEffect<Event> buildMainRefEffect(EntryRef headRef);

  void start();
  Future<void> close();
}
