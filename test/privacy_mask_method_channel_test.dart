import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privacy_mask/privacy_mask_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelPrivacyMask platform = MethodChannelPrivacyMask();
  const MethodChannel channel = MethodChannel('privacy_mask');

  // We use a list to track which calls were made to the mock channel
  final List<MethodCall> log = <MethodCall>[];

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          log.add(methodCall); // Record the call
          return null; // Our native methods return void (null in Dart)
        });
    log.clear(); // Clear history before each test
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('setSecure sends true to native platform', () async {
    await platform.setSecure(true);

    expect(log, <Matcher>[isMethodCall('setSecure', arguments: true)]);
  });

  test('setSecure sends false to native platform', () async {
    await platform.setSecure(false);

    expect(log, <Matcher>[isMethodCall('setSecure', arguments: false)]);
  });
}
