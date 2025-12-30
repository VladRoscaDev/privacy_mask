import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // To check kIsWeb
import 'package:privacy_mask/privacy_mask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isProtectionEnabled = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: PrivacyMask(
        enabled: _isProtectionEnabled,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Privacy Mask Multi-Platform'),
            centerTitle: true,
            backgroundColor: _isProtectionEnabled
                ? Colors.green.withValues(alpha: 0.1)
                : Colors.red.withValues(alpha: 0.1),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatusHeader(),
                  const SizedBox(height: 30),
                  _buildSensitiveCard(),
                  const SizedBox(height: 40),
                  _buildPlatformInstructions(),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () => setState(
                      () => _isProtectionEnabled = !_isProtectionEnabled,
                    ),
                    icon: Icon(
                      _isProtectionEnabled
                          ? Icons.shield_outlined
                          : Icons.shield,
                    ),
                    label: Text(
                      _isProtectionEnabled
                          ? "Disable Protection"
                          : "Enable Protection",
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isProtectionEnabled
                          ? Colors.red[50]
                          : Colors.green[50],
                      foregroundColor: _isProtectionEnabled
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusHeader() {
    return Column(
      children: [
        Icon(
          _isProtectionEnabled ? Icons.lock_rounded : Icons.lock_open_rounded,
          size: 80,
          color: _isProtectionEnabled ? Colors.green : Colors.red,
        ),
        const SizedBox(height: 20),
        Text(
          _isProtectionEnabled ? "Security Active" : "Security Paused",
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSensitiveCard() {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[800]!, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "PREMIUM BANK",
                style: TextStyle(color: Colors.white70, letterSpacing: 2),
              ),
              Icon(Icons.contactless, color: Colors.white54),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            "4444 5555 6666 7777",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 4,
              fontFamily: 'Courier',
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "VALID THRU: 12/28",
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformInstructions() {
    if (kIsWeb) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Column(
          children: [
            Text(
              "🌐 WEB PROTECTIONS ACTIVE",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 8),
            Text("• Try to switch tabs or click outside the window (Blur)"),
            Text("• Try to Right-Click or Copy text (Blocked)"),
            Text("• Try to Print / Save as PDF (Hidden)"),
          ],
        ),
      );
    }

    return const Column(
      children: [
        Text(
          "📱 MOBILE PROTECTIONS ACTIVE",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        SizedBox(height: 8),
        Text("• Screenshotting results in a black/error screen"),
        Text("• Screen recording is automatically blocked"),
      ],
    );
  }
}
