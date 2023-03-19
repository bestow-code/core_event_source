import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

/// Provides [Command] dispatch and an [Event]-based view

abstract class EventSource<Command, View> implements BlocBase<View> {
  void execute(Iterable<Command> commands);

  // Future<void> onReady
  @visibleForTesting
  void pause();

  @visibleForTesting
  void resume();
}
