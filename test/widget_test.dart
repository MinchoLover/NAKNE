import 'package:flutter_test/flutter_test.dart';

import 'package:nakne/main.dart';

void main() {
  testWidgets('NagNe mood diagnosis renders', (WidgetTester tester) async {
    await tester.pumpWidget(const LocalSwitchPohangApp());

    expect(find.text('나그네'), findsOneWidget);
    expect(find.text('Local Switch Pohang'), findsOneWidget);
    expect(find.text('오늘의 포항 여행 감성을 골라볼까요?'), findsOneWidget);
  });
}
