## 1.0.0

* Initial release of `privacy_mask`.
* Added `PrivacyMask` widget for easy UI integration.
* Implementation of Android `FLAG_SECURE` to block screenshots and screen recording.
* Implementation of iOS `isSecureTextEntry` layer hack to blackout recordings and snapshots.
* Automatic lifecycle management (protection toggles off when widget is disposed).


## 1.0.1

* Updated README

## 1.0.2

* Multi-Platform Support: Refactored to a Federated Plugin architecture, enabling seamless support for Android, iOS, and Web.

* Enhanced Web Privacy:

* Data Leak Prevention: Added blockers for "Right-Click" (context menu), "Copy", and "Drag-and-Drop" to prevent unauthorized saving of text and images.

* Anti-Print Logic: Implemented CSS Injection to hide app content automatically if the user attempts to print the page (Cmd/Ctrl + P).

* UI Protection: Added user-select: none to prevent text highlighting and selection on sensitive screens.

* Window Focus Tracking: Implemented "Soft Privacy" via CSS blur filters that trigger when the browser tab is switched or the window loses focus.

* Modern Web Interop: Built using the latest package:web and dart:js_interop for WebAssembly (Wasm) compatibility and future-proofing.

* Lifecycle Management: Added robust cleanup of JavaScript event listeners and injected styles when the PrivacyMask widget is disposed to prevent memory leaks and restore normal browser behavior.


## 1.0.3

* Minor adjustment to readme

## 1.0.4

* Updated to latest versions
