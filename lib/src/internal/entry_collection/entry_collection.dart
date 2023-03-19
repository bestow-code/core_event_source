import 'package:bloc/bloc.dart';

import '../../../entry.dart';

import '../../../internal.dart';

abstract class EntryCollection<Event> implements HeadEffectHandler<Event> {
  BlocBase get updates;

  /// Builds a HeadEffect to model a merge of [headRef] with the current main entry ref
  HeadEffect<Event> buildMerge(EntryRef headRef);
  HeadEffect<Event> buildInitial(EntryRef headRef);

  Future<void> close();
}
