// lib/presentation/widgets/scanner_screen.dart
import 'dart:io'; // For Platform check
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'dart:io'; // สำหรับเช็ค Platform
import 'package:flutter/foundation.dart'; // สำหรับ kIsWeb
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  // สร้าง Controller
  final MobileScannerController controller = MobileScannerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 🛑 เช็ค Platform: ถ้าเป็น Desktop หรือ Web ให้แสดงหน้าแจ้งเตือน
    bool isMobile = kIsWeb || (Platform.isAndroid || Platform.isIOS);

    if (!isMobile) {
      return Scaffold(
        appBar: AppBar(title: const Text('Scan QR Code'), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.videocam_off, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'Camera is not supported on this platform.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                '(${kIsWeb ? 'Web' : Platform.operatingSystem})',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        centerTitle: true,
        actions: [
          // ปุ่มเปิด/ปิดไฟฉาย
          // ✅ FIX: ใช้ ValueListenableBuilder ฟังที่ controller โดยตรง
          ValueListenableBuilder<MobileScannerState>(
            valueListenable: controller,
            builder: (context, state, child) {
              switch (state.torchState) {
                case TorchState.off:
                  return IconButton(
                    icon: const Icon(Icons.flash_off, color: Colors.grey),
                    onPressed: () => controller.toggleTorch(),
                  );
                case TorchState.on:
                  return IconButton(
                    icon: const Icon(Icons.flash_on, color: Colors.yellow),
                    onPressed: () => controller.toggleTorch(),
                  );
                case TorchState.auto:
                  return IconButton(
                    icon: const Icon(Icons.flash_auto, color: Colors.grey),
                    onPressed: () => controller.toggleTorch(),
                  );
                case TorchState.unavailable:
                  return const SizedBox.shrink();
              }
            },
          ),
          // ปุ่มสลับกล้องหน้า/หลัง
          // ✅ FIX: ใช้ ValueListenableBuilder ฟังที่ controller โดยตรง
          ValueListenableBuilder<MobileScannerState>(
            valueListenable: controller,
            builder: (context, state, child) {
              switch (state.cameraDirection) {
                case CameraFacing.front:
                  return IconButton(
                    icon: const Icon(Icons.camera_front),
                    onPressed: () => controller.switchCamera(),
                  );
                case CameraFacing.back:
                  return IconButton(
                    icon: const Icon(Icons.camera_rear),
                    onPressed: () => controller.switchCamera(),
                  );
              }
            },
          ),
        ],
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final String? code = barcodes.first.rawValue;
            if (code != null) {
              // หยุดกล้องก่อนปิดหน้า
              controller.stop();
              if (context.mounted) {
                Navigator.of(context).pop(code);
              }
            }
          }
        },
        errorBuilder: (context, error, child) {
          return Center(
            child: Text(
              'Camera Error: $error',
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
