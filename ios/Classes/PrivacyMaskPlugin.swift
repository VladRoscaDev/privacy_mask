import Flutter
import UIKit

public class PrivacyMaskPlugin: NSObject, FlutterPlugin {
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
            // Use the modern way to find the key window
            let window = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first ?? UIApplication.shared.windows.first

            guard let window = window else { return }

            if isSecure {
                if self.secureField == nil {
                    let field = UITextField()
                    field.isSecureTextEntry = true
                    field.isUserInteractionEnabled = false // Safety: prevents accidental focus
                    self.secureField = field
                    
                    window.addSubview(field)
                    // The 'last' sublayer is the one that contains the secure canvas in newer iOS versions
                    field.layer.sublayers?.last?.addSublayer(window.layer)
                }
            } else {
                self.secureField?.removeFromSuperview()
                self.secureField = nil
            }
        }
    }
}