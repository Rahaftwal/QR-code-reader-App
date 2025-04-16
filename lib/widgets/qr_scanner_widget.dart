// QR Code Reader
// Developed by Rahaf Altwal
// GitHub: https://github.com/Rahaftwal
// Email: rahaftwal@gmail.com

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../services/qr_scan_service.dart';

class QRScannerWidget extends StatefulWidget {
  const QRScannerWidget({super.key});

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  final QRScanService _scanService = QRScanService();
  MobileScannerController controller = MobileScannerController();
  bool _isFlashOn = false;
  bool _isFrontCamera = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          controller: controller,
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            for (final barcode in barcodes) {
              if (barcode.rawValue != null) {
                _scanService.saveScannedCode(barcode.rawValue!);
                _showResultDialog(barcode.rawValue!);
              }
            }
          },
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _isFlashOn = !_isFlashOn;
                    controller.toggleTorch();
                  });
                },
                child: Icon(_isFlashOn ? Icons.flash_off : Icons.flash_on),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _isFrontCamera = !_isFrontCamera;
                    controller.switchCamera();
                  });
                },
                child: Icon(_isFrontCamera ? Icons.camera_rear : Icons.camera_front),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showResultDialog(String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Scan Result'),
        content: SelectableText(result),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
} 