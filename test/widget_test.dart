import 'package:flutter_test/flutter_test.dart';
import 'package:game_console_flutter/main.dart';

void main() {
  testWidgets('shows the app title', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Game Console'), findsOneWidget);
  });
}
