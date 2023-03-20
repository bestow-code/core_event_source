import 'package:bloc_test/bloc_test.dart';
import 'package:core_event_source/event_source.dart';
import 'package:test/test.dart';
import '../test_doubles/fake_behavior.dart';
import '../util/debug_bloc_observer.dart';
import '_test_util.dart';

main() {}

// main() {
//   late EventSource<FakeCommand, FakeView> source1;
//   late EventSource<FakeCommand, FakeView> source2;
//
//   late FakeFirebaseFirestore firestore;
//   DebugBlocObserver.observe();
//
//   group('description', () {
//     blocTest(
//       'execute commands on separate source instances, in sequence',
//       setUp: () async {
//         firestore = FakeFirebaseFirestore.newInstance;
//
//         source1 = await buildTestEventSourceInstance(
//             headRefId: '1', firestore: firestore);
//         source2 = await buildTestEventSourceInstance(
//             headRefId: '2', firestore: firestore);
//       },
//       build: () => source2,
//       act: (_) {
//         source1.execute([{}]);
//       },
//       expect: () => [2],
//       skip: 0,
//     );
//   }, skip: true);
// }
