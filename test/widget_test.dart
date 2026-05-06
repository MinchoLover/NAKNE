import 'package:flutter_test/flutter_test.dart';

import 'package:nakne/main.dart';

void main() {
  testWidgets('Local Switch Pohang home renders', (WidgetTester tester) async {
    await tester.pumpWidget(const LocalSwitchPohangApp());

    expect(find.text('Local Switch Pohang'), findsOneWidget);
    expect(find.text('Pohang local experience MVP'), findsOneWidget);
  });
}
