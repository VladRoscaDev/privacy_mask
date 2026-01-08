# Privacy Mask 🛡️

A lightweight, high-performance Flutter widget that protects sensitive information by preventing screen recording and screenshots at the OS level.

[![pub points](https://img.shields.io/pub/points/privacy_mask?color=2E8B57)](https://pub.dev/packages/privacy_mask)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 🌟 Why Privacy Mask?

In 2025, mobile security is more than a feature—it's a requirement. Whether you're building a Banking, Healthcare (HIPAA), or Private Messaging app, `privacy_mask` ensures that sensitive data stays on the user's screen and out of their camera roll.

- **Android Support:** Uses `FLAG_SECURE` to block screenshots and screen recordings system-wide.
- **iOS Support:** Utilizes a secure layer hack (`isSecureTextEntry`) to black out recordings and screenshots.
- **Lifecycle Aware:** Automatically enables/disables protection as the widget enters or leaves the screen.

---

## 📸 See it in action

### Protection States
You can toggle protection dynamically. When enabled, the OS prevents the UI from being captured in the screen buffer.

| Protection Disabled | Protection Enabled |
| :---: | :---: |
| ![Protection Disabled](https://raw.githubusercontent.com/VladRoscaDev/privacy_mask/main/example/PrivacyOff.jpeg) | ![Protection Enabled](https://raw.githubusercontent.com/VladRoscaDev/privacy_mask/main/example/PrivacyOn.jpeg) |
| *App behaves normally* | *Ready for sensitive data* |

### Screenshot Prevention
When a user attempts to take a screenshot or record the screen while protection is active, the OS intercepts the action.

| Result of Screenshot/Recording |
| :---: |
| ![Screenshot Blocked](https://raw.githubusercontent.com/VladRoscaDev/privacy_mask/main/example/PrivacyPreview.jpeg) |
| *Android records a black screen/ iOS shows a security error* |

| Web Protection Disabled | Web Protection Enabled |
| :---: | :---: |
| ![Protection Disabled](https://raw.githubusercontent.com/VladRoscaDev/privacy_mask/main/example/web_privacy_off.png) | ![Protection Enabled](https://raw.githubusercontent.com/VladRoscaDev/privacy_mask/main/example/web_privacy_on.png) |
| *App behaves normally* | *Ready for sensitive data* |

---

## ⚠️ Warning
Note on Testing: Screenshot prevention is a hardware-level feature. It will not work on the iOS Simulator because the Simulator bypasses the iOS Render Server. To verify iOS protection, you must use a physical device and test using Screen Recording or Screen Mirroring.

## Web support
### Platform Security Matrix

| Feature | Android | iOS | Web |
| :--- | :---: | :---: | :---: |
| **Block Screenshot** | ✅ Yes | ✅ Yes | ❌ No* |
| **Block Screen Recording** | ✅ Yes | ✅ Yes | ❌ No* |
| **Blur on Inactivity** | ❌ No | ❌ No | ✅ **Yes** |
| **Block Text Selection** | ❌ No | ❌ No | ✅ **Yes** |
| **Block Context Menu** | ❌ No | ❌ No | ✅ **Yes** |
| **Block Printing** | ❌ No | ❌ No | ✅ **Yes** |

> **\*Note:** Browsers do not permit hardware-level blocking of screenshots or recordings. Web support provides the highest level of software-level deterrence possible.


## 🛑 Known Limitations & Security Disclosure
While privacy_mask provides robust protection, no software solution is 100% foolproof. Developers should be aware of the following platform-specific constraints:

📱 Mobile (iOS & Android)
iOS Simulator: Screenshot prevention does not work on the iOS Simulator. Apple’s render server only applies security layers on physical hardware.

External Hardware: This plugin cannot prevent someone from taking a physical photo of the device screen using another camera.

System UI: On some Android versions, the "Recent Apps" switcher may still show a snapshot of the app if the mask was not active before the app was minimized.

🌐 Web (The "Browser Sandbox")
OS-Level Tools: We cannot block the system's "Print Screen" key, Snipping Tool (Windows), or Grab (macOS).

Browser Extensions: Malicious browser extensions with "screen capture" permissions can bypass web-level event listeners.

Developer Tools: An advanced user can open the Browser Inspector (F12) and manually disable the CSS blur or hidden styles.

Intellectual Honesty: Web protection is a deterrent, not a total lock. It prevents 99% of casual "right-click save" or "accidental tab leak" scenarios but will not stop a determined attacker.

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  privacy_mask: ^1.0.3
