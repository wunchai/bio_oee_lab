// lib/presentation/widgets/scanner_screen.dart
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code'), centerTitle: true),
      body: MobileScanner(
        // ปรับแต่ง Controller ได้ถ้าต้องการ (เช่น เปิดไฟฉาย, สลับกล้อง)
        // controller: MobileScannerController(
        //   detectionSpeed: DetectionSpeed.noDuplicates,
        // ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;

          // เมื่อเจอ QR Code
          if (barcodes.isNotEmpty) {
            final String? code = barcodes.first.rawValue;
            if (code != null) {
              // ส่งค่า Code กลับไปหน้าก่อนหน้าทันที
              Navigator.of(context).pop(code);
            }
          }
        },
      ),
    );
  }
}
