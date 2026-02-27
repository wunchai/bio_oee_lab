import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';
import 'package:drift/drift.dart' as drift;

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
        final Map<String, dynamic> jsonResponse = jsonDecode(
          utf8.decode(response.bodyBytes),
        );

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

  Future<MachineSummaryResponse> getMachineSummary(
    String userId,
    String machineId,
  ) async {
    final Uri uri = Uri.parse('$_baseUrl/OEE_MACHINE_SUMMARY');

    final body = jsonEncode({'userId': userId, 'machineId': machineId});

    if (kDebugMode) {
      print('--- MachineSummary API RequestBody ---');
      print(body);
    }

    try {
      final response = await _client
          .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(
          utf8.decode(response.bodyBytes),
        );

        if (kDebugMode) {
          print('--- MachineSummary API RESPONSE ---');
          // print(utf8.decode(response.bodyBytes)); // Too large potentially
        }

        // Parse Summary
        final summaryJson = jsonResponse['Summary'] ?? jsonResponse['summary'];
        MachineSummariesCompanion summary;
        if (summaryJson != null) {
          final s = summaryJson as Map<String, dynamic>;
          summary = MachineSummariesCompanion.insert(
            machineId: s['MachineID']?.toString() ?? machineId,
            machineName: drift.Value(s['MachineName']?.toString()),
            status: drift.Value(s['Status']?.toString()),
            currentJobId: drift.Value(s['CurrentJobID']?.toString()),
            currentJobName: drift.Value(s['CurrentJobName']?.toString()),
            oeePercent: drift.Value((s['OEE'] as num?)?.toDouble() ?? 0.0),
            availability: drift.Value(
              (s['Availability'] as num?)?.toDouble() ?? 0.0,
            ),
            performance: drift.Value(
              (s['Performance'] as num?)?.toDouble() ?? 0.0,
            ),
            quality: drift.Value((s['Quality'] as num?)?.toDouble() ?? 0.0),
            updatedAt: drift.Value(DateTime.now().toIso8601String()),
          );
        } else {
          // Create a default/empty summary if missing
          summary = MachineSummariesCompanion.insert(
            machineId: machineId,
            updatedAt: drift.Value(DateTime.now().toIso8601String()),
          );
        }

        // Parse Items (Test Sets)
        final itemsJson = jsonResponse['Items'] ?? jsonResponse['items'];
        List<MachineSummaryItemsCompanion> items = [];
        if (itemsJson != null && itemsJson is List) {
          items = itemsJson.map((e) {
            final item = e as Map<String, dynamic>;
            return MachineSummaryItemsCompanion.insert(
              machineId: machineId,
              recId: item['RecID']?.toString() ?? '',
              jobTestSetRecId: drift.Value(item['JobTestSetRecID']?.toString()),
              testSetName: drift.Value(item['TestSetName']?.toString()),
              jobName: drift.Value(item['JobName']?.toString()),
              registerDateTime: drift.Value(
                item['RegisterDateTime']?.toString(),
              ),
              registerUser: drift.Value(item['RegisterUser']?.toString()),
              status: drift.Value(item['Status']?.toString()),
            );
          }).toList();
        }

        // Parse Events
        final eventsJson = jsonResponse['Events'] ?? jsonResponse['events'];
        List<MachineSummaryEventsCompanion> events = [];
        if (eventsJson != null && eventsJson is List) {
          events = eventsJson.map((e) {
            final ev = e as Map<String, dynamic>;
            return MachineSummaryEventsCompanion.insert(
              machineId: machineId,
              recId: ev['RecID']?.toString() ?? '',
              eventType: drift.Value(ev['EventType']?.toString()),
              startTime: drift.Value(ev['StartTime']?.toString()),
              endTime: drift.Value(ev['EndTime']?.toString()),
              durationSeconds: drift.Value(
                (ev['DurationSeconds'] as num?)?.toInt(),
              ),
              recordUserId: drift.Value(ev['RecordUserId']?.toString()),
            );
          }).toList();
        }

        return MachineSummaryResponse(
          summary: summary,
          items: items,
          events: events,
        );
      } else {
        // Fallback for demo if API endpoint doesn't exist yet/returns 404
        if (response.statusCode == 404) {
          return _mockSummary(machineId);
        }
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('MachineSummary API Error: $e');
      }
      // For development, return mock if it fails
      return _mockSummary(machineId);
    }
  }

  MachineSummaryResponse _mockSummary(String machineId) {
    return MachineSummaryResponse(
      summary: MachineSummariesCompanion.insert(
        machineId: machineId,
        machineName: drift.Value('Machine $machineId (Mock)'),
        status: const drift.Value('RUNNING'),
        currentJobName: const drift.Value('Test Set 001'),
        oeePercent: const drift.Value(85.5),
        availability: const drift.Value(90.0),
        performance: const drift.Value(95.0),
        quality: const drift.Value(99.0),
        updatedAt: drift.Value(DateTime.now().toIso8601String()),
      ),
      items: [],
      events: [],
    );
  }
}

class MachineSummaryResponse {
  final MachineSummariesCompanion summary;
  final List<MachineSummaryItemsCompanion> items;
  final List<MachineSummaryEventsCompanion> events;

  MachineSummaryResponse({
    required this.summary,
    required this.items,
    required this.events,
  });
}
