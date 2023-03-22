import 'package:core_event_source/internal.dart';
import 'package:core_event_source_test_util/core_event_source_test_util.dart';
import 'package:test/scaffolding.dart';

import '../event_source_impl/test_common.dart';

void main() {
  group('InMemoryDataStore', () {
    final dataStoreInternal = InMemoryDataStoreInternal<Event>.from();
    final dataStore = InMemoryDataStore<Event>(
        headRefName: '1', dataStoreInternal: dataStoreInternal);
    final specification = DataStoreSpecification(dataStore);
    specification.evaluate();
  });
}
