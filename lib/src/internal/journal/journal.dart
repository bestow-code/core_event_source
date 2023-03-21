import '../../../internal.dart';

abstract class Journal<Event> {
  Future<void> applyHeadEffect(HeadEffect<Event> effect);
  Future<void> applyMainRefEffect(MainRefEffect<Event> effect);
}
