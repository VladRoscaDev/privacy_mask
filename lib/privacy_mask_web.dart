import 'dart:js_interop';
import 'package:web/web.dart' as web;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'privacy_mask_platform_interface.dart';

class PrivacyMaskWeb extends PrivacyMaskPlatform {
  static void registerWith(Registrar registrar) {
    PrivacyMaskPlatform.instance = PrivacyMaskWeb();
  }

  JSFunction? _blurHandler;
  JSFunction? _focusHandler;
  JSFunction? _visibilityHandler;
  JSFunction? _preventActionHandler;

  @override
  Future<void> setSecure(bool enable) async {
    if (enable) {
      _attachListeners();
      _applyHardenedCSS(true);
    } else {
      _removeListeners();
      _applyBlur(false);
      _applyHardenedCSS(false);
    }
  }

  void _attachListeners() {
    if (_blurHandler != null) return;

    _blurHandler = ((web.Event _) => _applyBlur(true)).toJS;
    _focusHandler = ((web.Event _) => _applyBlur(false)).toJS;
    _visibilityHandler = ((web.Event _) {
      _applyBlur(web.document.visibilityState == 'hidden');
    }).toJS;

    // Handler to block right-click and copy
    _preventActionHandler = ((web.Event e) {
      e.preventDefault();
    }).toJS;

    web.window.addEventListener('blur', _blurHandler!);
    web.window.addEventListener('focus', _focusHandler!);
    web.document.addEventListener('visibilitychange', _visibilityHandler!);

    // Block Right Click (Context Menu)
    web.document.addEventListener('contextmenu', _preventActionHandler!);
    // Block Copy
    web.document.addEventListener('copy', _preventActionHandler!);
    // Block Dragging (prevents dragging images to desktop)
    web.document.addEventListener('dragstart', _preventActionHandler!);
  }

  void _removeListeners() {
    if (_blurHandler == null) return;

    web.window.removeEventListener('blur', _blurHandler!);
    web.window.removeEventListener('focus', _focusHandler!);
    web.document.removeEventListener('visibilitychange', _visibilityHandler!);
    web.document.removeEventListener('contextmenu', _preventActionHandler!);
    web.document.removeEventListener('copy', _preventActionHandler!);
    web.document.removeEventListener('dragstart', _preventActionHandler!);

    _blurHandler = null;
    _focusHandler = null;
    _visibilityHandler = null;
    _preventActionHandler = null;
  }

  void _applyHardenedCSS(bool secure) {
    const styleId = 'privacy-mask-styles';
    var styleElement =
        web.document.getElementById(styleId) as web.HTMLStyleElement?;

    if (secure && styleElement == null) {
      styleElement =
          web.document.createElement('style') as web.HTMLStyleElement;
      styleElement.id = styleId;
      // 1. user-select: none prevents text highlighting
      // 2. @media print hides the app when pressing Cmd+P / Ctrl+P
      styleElement.textContent = '''
        flt-glass-pane {
          user-select: none !important;
          -webkit-user-select: none !important;
          -webkit-touch-callout: none !important;
        }
        @media print {
          body { display: none !important; }
        }
      ''';
      web.document.head!.appendChild(styleElement);
    } else if (!secure && styleElement != null) {
      styleElement.remove();
    }
  }

  void _applyBlur(bool shouldBlur) {
    final elements = web.document.getElementsByTagName('flt-glass-pane');
    if (elements.length > 0) {
      final element = elements.item(0) as web.HTMLElement;
      element.style.filter = shouldBlur ? 'blur(30px)' : 'none';
      element.style.transition = 'filter 0.2s ease-in-out';
    }
  }
}
