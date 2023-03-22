import '../../../entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_snapshot.freezed.dart';

@freezed
class EntrySnapshot<Event> with _$EntrySnapshot<Event> {
  factory EntrySnapshot(Entry<Event> entry, {required bool isPending}) =
      _EntrySnapshot;
}
