import 'package:flutter/material.dart';
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
      home:
          _buildWithPrivacy(), //change to view Withour Privacy-> call the method below
    );
  }

  Widget _buildWithoutPrivacy() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Mask Demo'),
        backgroundColor: _isProtectionEnabled ? Colors.green : Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _isProtectionEnabled ? Icons.lock : Icons.lock_open,
                size: 80,
                color: _isProtectionEnabled ? Colors.green : Colors.red,
              ),
              const SizedBox(height: 20),
              Text(
                _isProtectionEnabled ? "Protection is ON" : "Protection is OFF",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Try taking a screenshot or recording the screen now.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const Divider(height: 40),

              // This represents sensitive information (like a bank card)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Text(
                      "SENSITIVE DATA",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("4444 5555 6666 7777", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isProtectionEnabled = !_isProtectionEnabled;
                  });
                },
                child: Text(
                  _isProtectionEnabled
                      ? "Disable Privacy Mask"
                      : "Enable Privacy Mask",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PrivacyMask _buildWithPrivacy() {
    return PrivacyMask(
      // The magic happens here:
      // When 'enabled' is true, the native platform flags are set.
      enabled: _isProtectionEnabled,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Privacy Mask Demo'),
          backgroundColor: _isProtectionEnabled ? Colors.green : Colors.red,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _isProtectionEnabled ? Icons.lock : Icons.lock_open,
                  size: 80,
                  color: _isProtectionEnabled ? Colors.green : Colors.red,
                ),
                const SizedBox(height: 20),
                Text(
                  _isProtectionEnabled
                      ? "Protection is ON"
                      : "Protection is OFF",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Try taking a screenshot or recording the screen now.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const Divider(height: 40),

                // This represents sensitive information (like a bank card)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "SENSITIVE DATA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "4444 5555 6666 7777",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isProtectionEnabled = !_isProtectionEnabled;
                    });
                  },
                  child: Text(
                    _isProtectionEnabled
                        ? "Disable Privacy Mask"
                        : "Enable Privacy Mask",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
