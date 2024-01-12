import 'dart:convert';

import 'package:njha_bird_detect/app/models/auth.dart';
import 'package:njha_bird_detect/app/models/history.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

import 'package:http/http.dart' as http;
import 'package:njha_bird_detect/app/shared/utils/storage.dart';

Future<Auth?> registerAccount(registerData) async {
  try {
    final response = await ApiService.post(
        ApiConfig.ENDPOINT['auth']!['register']!, registerData);

    final accessToken = response['accessToken'];
    final userData = response['data'];

    List<History> histories = [];
    final historiesData = userData['histories'] as List<dynamic>;
    for (var item in historiesData) {
      histories.add(History.fromJson(jsonDecode(item)));
    }

    return Auth(
        accessToken: accessToken,
        userData: UserData(
            id: userData['id'],
            email: userData['email'],
            username: userData['username'],
            createdAt: userData['createdAt'],
            histories: histories));
  } catch (e) {
    rethrow;
  }
}

Future<List<History>?> getHistories() async {
  try {
    final accessToken = await getLocalStorage('accessToken');

    final response = await http.get(
        Uri.parse('http://34.126.163.62/api/histories/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        });
    final List<History> histories = [];
    if (response.statusCode == 200) {
      for (var item in jsonDecode(response.body) as List<dynamic>) {
        histories.add(History.fromJson(item));
      }
      return histories;
    }
    return null;
  } catch (e) {
    rethrow;
  }
}

Future<bool> deleteHistory(int id) async {
  try {
    final accessToken = await getLocalStorage('accessToken');

    final response = await http.delete(
        Uri.parse('http://34.126.163.62/api/histories/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (e) {
    rethrow;
  }
}

Future<Auth?> loginAccount(loginData) async {
  try {
    final response =
        await ApiService.post(ApiConfig.ENDPOINT['auth']!['login']!, loginData);

    Auth auth = Auth.fromJson(response);
    return auth;
  } catch (e) {
    rethrow;
  }
}
