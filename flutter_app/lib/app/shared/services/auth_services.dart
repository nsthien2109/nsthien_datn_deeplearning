import 'dart:convert';

import 'package:njha_bird_detect/app/models/auth.dart';
import 'package:njha_bird_detect/app/models/history.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

Future<Auth?> registerAccount(registerData) async {
  try {
    final response = await ApiService.post(
        ApiConfig.ENDPOINT['auth']!['register']!, registerData);

    final accessToken = response['accessToken'];
    final userData = response['data'];

    List<History> histories = [];
    final historiesData = userData['histories'] as List<dynamic>;
    historiesData
        .forEach((item) => histories.add(History.fromJson(jsonDecode(item))));

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

Future<Auth?> loginAccount(loginData) async {
  try {
    final response =
        await ApiService.post(ApiConfig.ENDPOINT['auth']!['login']!, loginData);

    final accessToken = response['accessToken'];
    final userData = response['data'];

    return Auth.fromJson(response);
  } catch (e) {
    rethrow;
  }
}
