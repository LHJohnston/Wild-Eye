// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });


  testWidgets('Flora item is deleted on long press', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FloraList(),
      ),
    );
    expect(find.text('add more flora'), findsOneWidget);

    // finds the ListTile
    final listItemFinder = find.byType(ListTile);

    // check there is only one
    expect(listItemFinder, findsOneWidget);

    // delete
    await tester.longPress(listItemFinder);

    // check if deleted
    expect(find.text('add more flora'), findsNothing);
    expect(listItemFinder, findsNothing);
  });
}
