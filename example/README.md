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

| Protection ON (Android) | Protection ON (iOS) |
| :---: | :---: |
| ![Android Blocked Placeholder](https://raw.githubusercontent.com/YOUR_USERNAME/privacy_mask/main/doc/android_blocked.png) | ![iOS Blackout Placeholder](https://raw.githubusercontent.com/YOUR_USERNAME/privacy_mask/main/doc/ios_blackout.png) |
| *System prevents capture* | *Content appears as a black box* |

---

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  privacy_mask: ^1.0.0