import 'package:bloc/bloc.dart';

/// Provides [Command] dispatch and an [Event]-based view

abstract class EventSource<Command, View> implements BlocBase<View> {
  void execute(Iterable<Command> commands);

  // Future<void> onReady
  void pause();

  void resume();
}
