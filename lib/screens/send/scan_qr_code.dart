import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:gema_mobile/utils/colors.dart';
import 'package:gema_mobile/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({Key? key}) : super(key: key);

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  Barcode? barcode;

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Get.back(result: barcode?.code.toString()),
        ),
        title: Text(
          "Scanning",
          style: TextStyle(
            fontSize: getProportionateScreenHeight(16),
            fontWeight: FontWeight.w400,
            fontFamily: "Supermolot",
          ),
        ),
      ),
      body: QRView(
          key: qrKey,
          overlay: QrScannerOverlayShape(
            borderColor: kSecondaryColor,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: 300,
          ),
          onQRViewCreated: (controller) {
            this.controller = controller;

            controller.scannedDataStream.listen((scanData) {
              setState(() {
                barcode = scanData;
              });
            }).onData((data) {
              // controller.pauseCamera();
              showToast(
                "Found some data ${data.code}",
                context: context,
                animation: StyledToastAnimation.fadeScale,
                position: StyledToastPosition.center,
              );
              Get.back(result: data.code);
            });
            if (barcode != null) {
              log(barcode!.rawBytes.toString());
            }
            controller.pauseCamera();
            controller.resumeCamera();
          }),
    );
  }
}
