import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:njha_bird_detect/app/shared/utils/storage.dart';

class ApiService {
  static final http.Client httpClient = http.Client();

  static Future<Map<String, String>?> _getHeaders() async {
    final accessToken = await getLocalStorage('accessToken');
    return {
      'Content-Type': 'application/json',
      if (accessToken != null) 'Authorization': 'Bearer $accessToken',
    };
  }

  static Future<String> _handleError(dynamic error) async {
    if (error is http.Response) {
      if (jsonDecode(error.body) is Map<String, dynamic>) {
        final Map<String, dynamic> response = jsonDecode(error.body);
        final List<String> errors = [];
        errors.add(
            response['errors'] ?? response['error'] ?? response['message']);
        return errors.isNotEmpty ? errors[0] : 'Unknown error';
      }
      if (error.statusCode == 401) {
        return 'Please login to do this action!';
      }
      return 'Server Error: ${error.statusCode}';
    } else if (error is http.ClientException) {
      return 'Network Error: ${error.message}';
    } else {
      return 'An unexpected error occurred.';
    }
  }

  static Future<Map<String, dynamic>> get(String url,
      [dynamic queryParams, dynamic moreConfigs]) async {
    final headers = await _getHeaders();
    final response = await httpClient.get(Uri.parse(url), headers: headers);
    return await _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(String url,
      [dynamic data, dynamic moreConfigs]) async {
    final headers = await _getHeaders();
    final response = await httpClient.post(Uri.parse(url),
        headers: headers, body: jsonEncode(data));
    return await _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String url,
      [dynamic data, dynamic moreConfigs]) async {
    final headers = await _getHeaders();
    final response = await httpClient.put(Uri.parse(url),
        headers: headers, body: jsonEncode(data));
    return await _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String url,
      [dynamic moreConfigs]) async {
    final headers = await _getHeaders();
    final response = await httpClient.delete(Uri.parse(url), headers: headers);
    return await _handleResponse(response);
  }

  static Future<Map<String, dynamic>> _handleResponse(
      http.Response response) async {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(await _handleError(response));
    }
  }
}
