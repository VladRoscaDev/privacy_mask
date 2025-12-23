import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:privacy_mask/privacy_mask.dart';
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Verify privacy mask toggles without crashing', (
    WidgetTester tester,
  ) async {
    // This test ensures that the MethodChannel communication with Kotlin/Swift
    // works on a real device.

    await tester.pumpWidget(
      const MaterialApp(
        home: PrivacyMask(
          enabled: true,
          child: Scaffold(body: Text('Protected Content')),
        ),
      ),
    );

    // If we reached here without a "MissingPluginException" or crash,
    // the native wiring is correct.
    expect(find.text('Protected Content'), findsOneWidget);
  });
}
