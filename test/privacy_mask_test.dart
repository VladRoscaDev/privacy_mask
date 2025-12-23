import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privacy_mask/privacy_mask.dart';
import 'package:privacy_mask/privacy_mask_platform_interface.dart';
import 'package:privacy_mask/privacy_mask_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// A mock implementation of the platform interface to intercept calls
/// during tests without needing a real Android/iOS device.
class MockPrivacyMaskPlatform
    with MockPlatformInterfaceMixin
    implements PrivacyMaskPlatform {
  bool isSecureSet = false;

  @override
  Future<void> setSecure(bool enable) {
    isSecureSet = enable;
    return Future.value();
  }
}

void main() {
  // Store the initial platform to verify default behavior
  final PrivacyMaskPlatform initialPlatform = PrivacyMaskPlatform.instance;

  test('$MethodChannelPrivacyMask is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPrivacyMask>());
  });

  group('PrivacyMask Widget Tests', () {
    late MockPrivacyMaskPlatform fakePlatform;

    setUp(() {
      fakePlatform = MockPrivacyMaskPlatform();
      PrivacyMaskPlatform.instance = fakePlatform;
    });

    testWidgets('should enable protection on mount', (
      WidgetTester tester,
    ) async {
      // Build the PrivacyMask widget
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: PrivacyMask(enabled: true, child: SizedBox()),
        ),
      );

      // Verify that the native 'setSecure' was called with true
      expect(fakePlatform.isSecureSet, isTrue);
    });

    testWidgets('should disable protection on dispose', (
      WidgetTester tester,
    ) async {
      // 1. Build the widget
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: PrivacyMask(enabled: true, child: SizedBox()),
        ),
      );
      expect(fakePlatform.isSecureSet, isTrue);

      // 2. Remove the widget from the tree (pumping a different widget)
      await tester.pumpWidget(const SizedBox());

      // 3. Verify that dispose() called setSecure(false)
      expect(fakePlatform.isSecureSet, isFalse);
    });

    testWidgets('should toggle protection when enabled property changes', (
      WidgetTester tester,
    ) async {
      // 1. Start with disabled
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: PrivacyMask(enabled: false, child: SizedBox()),
        ),
      );
      expect(fakePlatform.isSecureSet, isFalse);

      // 2. Update the widget to enabled: true
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: PrivacyMask(enabled: true, child: SizedBox()),
        ),
      );

      expect(fakePlatform.isSecureSet, isTrue);
    });
  });
}
