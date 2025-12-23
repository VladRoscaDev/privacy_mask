import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'privacy_mask_platform_interface.dart';

/// An implementation of [PrivacyMaskPlatform] that uses method channels.
class MethodChannelPrivacyMask extends PrivacyMaskPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('privacy_mask');

  @override
  Future<void> setSecure(bool enable) async {
    // This 'setSecure' string must match the one you used in Kotlin and Swift
    await methodChannel.invokeMethod<void>('setSecure', enable);
  }
}
