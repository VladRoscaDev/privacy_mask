import Flutter
import UIKit

public class PrivacyMaskPlugin: NSObject, FlutterPlugin {
    // We store a reference to the hidden text field
    private var secureField: UITextField?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "privacy_mask", binaryMessenger: registrar.messenger())
        let instance = PrivacyMaskPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "setSecure") {
            let isSecure = call.arguments as? Bool ?? false
            self.togglePrivacy(isSecure: isSecure)
            result(nil)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func togglePrivacy(isSecure: Bool) {
        DispatchQueue.main.async {
            // Find the main window of the app
            guard let window = UIApplication.shared.windows.first else { return }

            if isSecure {
                if self.secureField == nil {
                    let field = UITextField()
                    field.isSecureTextEntry = true
                    self.secureField = field
                    
                    // Add the field to the window and its layer to the sublayer
                    window.addSubview(field)
                    window.layer.superlayer?.addSublayer(field.layer)
                    field.layer.sublayers?.first?.addSublayer(window.layer)
                }
            } else {
                // Remove the field and restore the layer
                self.secureField?.removeFromSuperview()
                self.secureField = nil
            }
        }
    }
}