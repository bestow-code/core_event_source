import 'package:core_event_source_test_util/core_event_source_test_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_core_event_source_test_util/flutter_core_event_source_test_util.dart';

main() async => MergeTestGroup(
      FirestoreTestEventStoreFactory(
        () async => await Firebase.initializeApp(),
      ),
    ).run();
