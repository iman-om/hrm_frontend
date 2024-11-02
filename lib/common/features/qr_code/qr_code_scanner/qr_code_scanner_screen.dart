import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/features/qr_code/qr_code_scanner/qr_code_scanner_controller.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScannerScreen extends StatelessWidget {
  const QRCodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QRCodeScannerController>(
      init: QRCodeScannerController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                MobileScanner(
                  controller: controller.mobileScannerController,
                  onDetect: controller.onDetect,
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.2),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 2),
                        ),
                        child: GetBuilder<QRCodeScannerController>(
                          builder: (controller) {
                            return Stack(
                              children: [
                                Positioned.fill(
                                  child: AnimatedBuilder(
                                    animation: controller.animation,
                                    builder: (context, child) {
                                      return CustomPaint(
                                        painter: _MovingLinePainter(controller.animation.value),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white, size: 30),
                          onPressed: () {
                            controller.zoomOut();
                          },
                        ),
                        Container(
                          height: 2,
                          width: 70,
                          color: Colors.white,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.white, size: 30),
                          onPressed: () {
                            controller.zoomIn();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MovingLinePainter extends CustomPainter {
  final double position;

  _MovingLinePainter(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 4;

    final yPos = position * size.height;
    canvas.drawLine(Offset(0, yPos), Offset(size.width, yPos), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
