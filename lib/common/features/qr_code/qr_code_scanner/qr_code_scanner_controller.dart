import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScannerController extends GetxController with SingleGetTickerProviderMixin {
final MobileScannerController mobileScannerController = MobileScannerController();
late AnimationController animationController;
late Animation<double> animation;
double currentZoom = 1.0;

@override
void onInit() {
  super.onInit();
  animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  animation = Tween<double>(begin: 0, end: 1).animate(animationController);
}

@override
void onClose() {
  animationController.dispose();
  mobileScannerController.dispose();
  super.onClose();
}

void onDetect(BarcodeCapture capture) {
  final List<Barcode> barcodes = capture.barcodes;
  for (final barcode in barcodes) {
    print('Barcode found: ${barcode.rawValue}');
    Get.snackbar('QR Code Scanned', 'Data: ${barcode.rawValue}');
    animationController.stop();
  }
}

void toggleFlash() {
  mobileScannerController.toggleTorch();
}

void zoomIn() {
  if (currentZoom < 1.0) {
    currentZoom += 0.1;
    mobileScannerController.setZoomScale(currentZoom);
    update();
  }
}

void zoomOut() {
  if (currentZoom > 0.0) {
    currentZoom -= 0.1;
    mobileScannerController.setZoomScale(currentZoom);
    update();
  }
}
}