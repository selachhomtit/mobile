import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_flutter_app/main.dart';

void main() {
  testWidgets('Greeting shows and counter increments and resets',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Hello Android!'), findsOneWidget);
    expect(find.text('You tapped the button 0 times'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Tap me'));
    await tester.pump();
    expect(find.text('You tapped the button 1 times'), findsOneWidget);

    await tester.tap(find.widgetWithText(OutlinedButton, 'Reset'));
    await tester.pump();
    expect(find.text('You tapped the button 0 times'), findsOneWidget);
  });
}
