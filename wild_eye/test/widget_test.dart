// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wild_eye/Pages/home_screen.dart';
import 'package:wild_eye/Pages/flora_list_display.dart';


void main() {
 /* testWidgets('Counter increments smoke test', (WidgetTester tester) async {
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
  });*/


  testWidgets('Flora item is deleted on long press', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FloraList(camera: Placeholder()),
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

  testWidgets('Button loads Flora list', (WidgetTester tester) async{
    await tester.pumpWidget(const MaterialApp(
      home:HomeScreen(theCamera: Placeholder())
    ));

    final floraFinder = find.text("Flora");
    expect(floraFinder, findsOne);
    await tester.tap(floraFinder);
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOne);
    final floraTitleFinder = find.text("Flora");
    expect(floraTitleFinder, findsOne);
  });

  testWidgets('Button loads Fauna list', (WidgetTester tester) async{
    await tester.pumpWidget(const MaterialApp(
      home:HomeScreen(theCamera: Placeholder())
    ));

    final faunaFinder = find.text("Fauna");
    expect(faunaFinder, findsOne);
    await tester.tap(faunaFinder);
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOne);
    final faunaTitleFinder = find.text("Fauna");
    expect(faunaTitleFinder, findsOne);
  });
}
