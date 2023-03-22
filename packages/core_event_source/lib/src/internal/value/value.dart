import 'package:bloc/bloc.dart';

import '../../../internal.dart';

abstract class Value<Event, T> implements HeadEffectHandler<Event> {
  BlocBase<T> get source;

  T get current;

  Future<void> close();
}
