import 'package:core_event_source/internal.dart';
import 'package:test/test.dart';

import '../event_source_impl/test_common.dart';

main() {
  // late MainRefUpdateDispatcherImpl mainRefUpdateDispatcherImpl;
  setUp(() {
    // mainRefUpdateDispatcherImpl = MainRefUpdateDispatcherImpl();
  });

  group('main ref update', () {
    late final DataStore<Event> dataStore;
    late final EntryCollection<Event> entryCollection;
    test('path forward available', () {});
    test('path forward not available', () {});
    test('retry on connection failure', () {});
  });
}
