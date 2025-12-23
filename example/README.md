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

---



## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  privacy_mask: ^1.0.0

## ⚠️ Note on Testing: Screenshot prevention is a hardware-level feature. It will not work on the iOS Simulator because the Simulator bypasses the iOS Render Server. To verify iOS protection, you must use a physical device and test using Screen Recording or Screen Mirroring.
