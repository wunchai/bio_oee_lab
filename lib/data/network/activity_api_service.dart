import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:bio_oee_lab/core/app_config.dart';
import 'package:bio_oee_lab/data/database/app_database.dart';

class ActivityApiService {
  final http.Client _client = http.Client();

  // Endpoint for uploading activity logs
  final String _uploadUrl = '${AppConfig.baseUrl}/OEE_ACTIVITY_LOG_SYNC';

  Future<List<String>> uploadActivityLogs(List<DbActivityLog> logs) async {
    final Uri uri = Uri.parse(_uploadUrl);

    // Convert logs to JSON
    final List<Map<String, dynamic>> jsonLogs = logs
        .map((log) => log.toJson())
        .toList();
    final String requestBody = jsonEncode(jsonLogs);

    if (kDebugMode) {
      print('--- UPLOAD ACTIVITY LOGS (${logs.length} records) ---');
      print(requestBody);
    }

    try {
      final response = await _client
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: requestBody,
          )
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final String jsonString = utf8.decode(response.bodyBytes);

        if (kDebugMode) {
          print('--- UPLOAD RESPONSE ---');
          print(jsonString);
        }

        // Expecting a list of successful recIDs
        final List<dynamic> jsonResponse = jsonDecode(jsonString);
        return jsonResponse.map((e) => e.toString()).toList();
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Cannot connect to server. Please check network.');
    } on TimeoutException {
      throw Exception('Server did not respond in time.');
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }
}
