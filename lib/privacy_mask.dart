import 'package:flutter/widgets.dart';
import 'privacy_mask_platform_interface.dart';

class PrivacyMask extends StatefulWidget {
  /// The content that should be protected from screen recording/screenshots.
  final Widget child;

  /// Whether the protection is currently active.
  final bool enabled;

  const PrivacyMask({super.key, required this.child, this.enabled = true});

  @override
  State<PrivacyMask> createState() => _PrivacyMaskState();
}

class _PrivacyMaskState extends State<PrivacyMask> {
  @override
  void initState() {
    super.initState();
    if (widget.enabled) {
      _updateProtection(true);
    }
  }

  @override
  void didUpdateWidget(PrivacyMask oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      _updateProtection(widget.enabled);
    }
  }

  @override
  void dispose() {
    // Always disable protection when the widget is removed
    // to avoid locking the user's whole phone experience.
    _updateProtection(false);
    super.dispose();
  }

  void _updateProtection(bool shouldProtect) {
    PrivacyMaskPlatform.instance.setSecure(shouldProtect);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
