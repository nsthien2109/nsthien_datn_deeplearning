import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:njha_bird_detect/app/constants/index.dart';
import 'package:njha_bird_detect/app/shared/utils/storage.dart';


class ApiService {
  final String baseUrl = 'YOUR_BASE_API_URL';
  late final  http.Client httpClient;

  ApiService() {
    httpClient = http.Client();
  }

  Future<Map<String, String>?> _getHeaders() async {
    final accessToken = await getLocalStorage(StorageKey.accessToken);
    return {
      'Content-Type': 'application/json',
      if (accessToken != null && !baseUrl.contains('.amazonaws.com'))
        'Authorization': 'Bearer $accessToken',
    };
  }

  Future<Map<String, dynamic>> _handleError(dynamic error) async {
    if (error is http.Response) {
      if (jsonDecode(error.body) is Map<String, dynamic>) {
        final Map<String, dynamic> response = jsonDecode(error.body);
        final List<String> errors = response['errors'];
        throw Exception(errors.isNotEmpty ? errors[0] : 'Unknown error');
      }
      if (error.statusCode == 401) {
        throw Exception('Please login to do this action!');
      }
      throw Exception('Server Error: ${error.statusCode}');
    } else if (error is http.ClientException) {
      throw Exception('Network Error: ${error.message}');
    } else {
      throw Exception('An unexpected error occurred.');
    }
  }

  Future<Map<String, dynamic>> get(String url, [dynamic queryParams, dynamic moreConfigs]) async {
    final headers = await _getHeaders();
    final response = await httpClient.get(Uri.parse(url), headers: headers);
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(String url, [dynamic data, dynamic moreConfigs]) async {
    final headers = await _getHeaders();
    final response = await httpClient.post(Uri.parse(url), headers: headers, body: jsonEncode(data));
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> put(String url, [dynamic data, dynamic moreConfigs]) async {
    final headers = await _getHeaders();
    final response = await httpClient.put(Uri.parse(url), headers: headers, body: jsonEncode(data));
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> delete(String url, [dynamic moreConfigs]) async {
    final headers = await _getHeaders();
    final response = await httpClient.delete(Uri.parse(url), headers: headers);
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw _handleError(response);
    }
  }
}
