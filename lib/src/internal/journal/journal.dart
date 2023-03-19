import '../../../internal.dart';

abstract class Journal<Event> {
  Future<void> apply(HeadEffect<Event> effect);
}
