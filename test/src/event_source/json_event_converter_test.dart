import 'package:core_event_source/common.dart';
import 'package:core_event_source/event_source.dart';
import 'package:test/test.dart';

// class TestEve

main() {
  test('instantiation', () {
    JsonEventConverter<JsonObject>(
        (jsonObject) => jsonObject as JsonObject, (object) => object);
  });
}
