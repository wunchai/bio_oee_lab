import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

class MachineSyncResponse {
  final List<DbMachine> machines;
  final int totalPages;

  MachineSyncResponse({required this.machines, required this.totalPages});
}

class MachineApiService {
  final http.Client _client = http.Client();
  final String _baseUrl = AppConfig.baseUrl;

  Future<MachineSyncResponse> getMachines(
    String userId,
    int pageIndex, {
    int pageSize = 10,
  }) async {
    final Uri uri = Uri.parse('$_baseUrl/OEE_MACHINE_SYNC');

    final body = jsonEncode({
      'userId': userId,
      'pageIndex': pageIndex.toString(),
      'pageSize': pageSize.toString(),
    });

    if (kDebugMode) {
      print('--- MachineSync API RequestBody (Page $pageIndex) ---');
      print(body);
    }

    try {
      final response = await _client
          .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (kDebugMode) {
          print('--- MachineSync API RESPONSE (Page $pageIndex) ---');
          print(utf8.decode(response.bodyBytes));
        }

        final int totalPages =
            jsonResponse['TotalPages'] ?? jsonResponse['totalPages'] ?? 0;

        List<dynamic> list = [];
        var rawData =
            jsonResponse['Machines'] ??
            jsonResponse['machines'] ??
            jsonResponse['Data'] ??
            jsonResponse['data'];

        if (rawData != null) {
          if (rawData is String) {
            try {
              list = jsonDecode(rawData);
            } catch (e) {
              print('Error decoding machines string: $e');
              list = [];
            }
          } else if (rawData is List) {
            list = rawData;
          }
        }

        final List<DbMachine> mappedMachines = list.map((item) {
          final map = item as Map<String, dynamic>;
          return DbMachine(
            uid: 0,
            machineId:
                map['MachineID']?.toString() ?? map['machineId']?.toString(),
            barcodeGuid:
                map['BarcodeGUID']?.toString() ??
                map['barcodeGuid']?.toString(),
            machineNo:
                map['MachineNo']?.toString() ?? map['machineNo']?.toString(),
            machineName:
                map['MachineName']?.toString() ??
                map['machineName']?.toString(),
            status: map['Status']?.toString() ?? map['status']?.toString(),
            updatedAt: null,
          );
        }).toList();

        return MachineSyncResponse(
          machines: mappedMachines,
          totalPages: totalPages,
        );
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch machines: $e');
    }
  }
}
