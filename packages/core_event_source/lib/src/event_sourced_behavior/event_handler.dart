import '../../event_sourced_behavior.dart';

typedef StateEventHandler<Event, State> = ValueHandler<Event, State>;
