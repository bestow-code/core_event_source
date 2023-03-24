import 'dart:math';

import '../../../entry.dart';

class EntryRefFactory {
  factory EntryRefFactory.basic() => EntryRefFactory(IdFactory.random());
  factory EntryRefFactory.increment([int start = 0]) =>
      EntryRefFactory(IdFactory.increment(start));
  EntryRefFactory(this._idFactory);
  final IdFactory _idFactory;

  EntryRef create() => EntryRef(_idFactory.create());
}

class IdFactory {
  final String Function() _create;

  factory IdFactory.random() => IdFactory(AutoIdGenerator.autoId);
  factory IdFactory.increment([int start = 0]) => IdFactory(() {
        var _start = start;
        _start = _start + 1;
        return _start.toString();
      });

  IdFactory(this._create);

  String create() => _create();
}

abstract class AutoIdGenerator {
  static const int autoIdLength = 20;

  static const String autoIdAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      'abcdefghijklmnopqrstuvwxyz'
      '0123456789';

  static final Random _random = Random();

  /// Automatically Generates a random new Id
  static String autoId() {
    final StringBuffer stringBuffer = StringBuffer();
    const int maxRandom = autoIdAlphabet.length;

    for (int i = 0; i < autoIdLength; ++i) {
      stringBuffer.write(autoIdAlphabet[_random.nextInt(maxRandom)]);
    }

    return stringBuffer.toString();
  }
}
