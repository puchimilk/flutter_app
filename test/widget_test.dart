// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:flutter_app/main.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('MyApp', (WidgetTester tester) async {
    // await tester.pumpWidget(const ProviderScope(child: const MyApp()));
    await tester.pumpWidget(const MyApp());
  });
}
