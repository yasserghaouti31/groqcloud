import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:deepseek_app/main.dart';

void main() async {
  // Load test environment variables
  await dotenv.load(fileName: "assets/key.env");

  testWidgets('Basic app test', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const ChatApp()); // Changed from MyApp

    // Verify initial state
    expect(find.text('DeepSeek Chat'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
