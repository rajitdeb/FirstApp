import 'package:dirst_app/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

// This is how we write Widget Test
void main() {

  // testWidgets("Hello World Test", (widgetTester) async {
  //
  //   // Pump Widget adds widget to the frame
  //   await widgetTester.pumpWidget(const MyApp());
  //
  //   // Here, this code tries to find the element, and its expected result
  //   expect(find.byType(Container), findsOneWidget);
  //   // expect(find.text("Hello World!"), findsOneWidget);
  //
  // });

  testWidgets("Calculator Test", (widgetTester) async {

    // Pump Widget adds widget to the frame
    await widgetTester.pumpWidget(const MyApp());

    // Here, this code tries to find the element, and its expected result
    expect(find.byKey(const Key("Result")), findsOneWidget);

    final d1 = find.byKey(Key("displayOne")); // This returns a finder
    final d2 = find.byKey(Key("displayTwo")); // This returns a finder

    expect(d1, findsOneWidget);
    expect(d2, findsOneWidget);

    // Finding Elements by Icon
    expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);

    // Find Clear Button
    expect(find.text("Clear"), findsOneWidget);

    // Enter text in DisplayOne
    await widgetTester.enterText(d1, "20");

    // Enter text in DisplayTwo
    await widgetTester.enterText(d2, "10");

    // Add Operation
    // Perform Button Click
    await widgetTester.tap(find.byIcon(CupertinoIcons.add));

    // Changes the frame, or updates the frame
    await widgetTester.pump();

    expect(find.text("30"), findsOneWidget);

    // Subtract Operation
    // Perform Button Click
    await widgetTester.tap(find.byIcon(CupertinoIcons.minus));

    // Changes the frame, or updates the frame
    await widgetTester.pump();

    expect(find.text("10"), findsNWidgets(2));

    // Multiply Operation
    // Perform Button Click
    await widgetTester.tap(find.byIcon(CupertinoIcons.multiply));

    // Changes the frame, or updates the frame
    await widgetTester.pump();

    expect(find.text("200"), findsOneWidget);

    // Divide Operation
    // Perform Button Click
    await widgetTester.tap(find.byIcon(CupertinoIcons.divide));

    // Changes the frame, or updates the frame
    await widgetTester.pump();

    expect(find.text("2.0"), findsOneWidget);

  });
}
