import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localization/localization.dart';

void main() {
  test('supports English', () {
    expect(S.delegate.isSupported(const Locale('en')), isTrue);
    expect(S.delegate.isSupported(const Locale('fr')), isFalse);
  });
}
