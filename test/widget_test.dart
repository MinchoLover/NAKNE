import 'package:flutter_test/flutter_test.dart';

import 'package:nakne/main.dart';

void main() {
  testWidgets('NagNe home renders', (WidgetTester tester) async {
    await tester.pumpWidget(const LocalSwitchPohangApp());

    expect(find.text('나그네'), findsOneWidget);
    expect(find.text('Local Switch Pohang'), findsOneWidget);
  });
}
