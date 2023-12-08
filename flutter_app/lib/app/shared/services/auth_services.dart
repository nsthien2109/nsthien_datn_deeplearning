import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:njha_bird_detect/app/models/auth.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

Future<Auth?> registerAccount(registerData) async {
  try {
    final response = await ApiService.get(
        ApiConfig.ENDPOINT['auth']!['register']!, registerData);

    final accessToken = response['accessToken'];
    final userData = json.decode(response['data']);

    return Auth(
        accessToken: accessToken,
        userData: UserData(
            id: userData['id'],
            email: userData['email'],
            username: userData['username'],
            createdAt: userData['createdAt']));
  } catch (e) {
    debugPrint('${e}');
    rethrow;
  }
}
