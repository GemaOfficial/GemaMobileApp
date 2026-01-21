import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:get/get.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({Key? key}) : super(key: key);

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Scanning",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Supermolot",
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.qr_code_scanner, size: 100, color: Colors.white54),
            const SizedBox(height: 20),
            const Text(
              "QR Scanner is currently being updated.",
              style: TextStyle(color: Colors.white),
            ),
            if (kDebugMode)
              TextButton(
                onPressed: () => Get.back(result: "dummy_address"),
                child: const Text("Simulate Scan (Debug Only)"),
              )
          ],
        ),
      ),
    );
  }
}
