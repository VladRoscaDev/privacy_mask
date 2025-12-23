import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'privacy_mask_method_channel.dart';

abstract class PrivacyMaskPlatform extends PlatformInterface {
  /// Constructs a PrivacyMaskPlatform.
  PrivacyMaskPlatform() : super(token: _token);

  static final Object _token = Object();

  static PrivacyMaskPlatform _instance = MethodChannelPrivacyMask();

  /// The default instance of [PrivacyMaskPlatform] to use.
  static PrivacyMaskPlatform get instance => _instance;

  /// Platform-specific implementations should set this.
  static set instance(PrivacyMaskPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// This is the new method that triggers the native privacy protection.
  /// We remove getPlatformVersion because we don't need it for this package.
  Future<void> setSecure(bool enable) {
    throw UnimplementedError('setSecure() has not been implemented.');
  }
}
