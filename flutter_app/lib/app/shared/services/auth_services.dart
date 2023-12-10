import 'package:njha_bird_detect/app/models/auth.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

Future<Auth?> registerAccount(registerData) async {
  try {
    final response = await ApiService.post(
        ApiConfig.ENDPOINT['auth']!['register']!, registerData);

    final accessToken = response['accessToken'];
    final userData = response['data'];

    return Auth(
        accessToken: accessToken,
        userData: UserData(
            id: userData['id'],
            email: userData['email'],
            username: userData['username'],
            createdAt: userData['createdAt']));
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

    return Auth(
        accessToken: accessToken,
        userData: UserData(
            id: userData['id'],
            email: userData['email'],
            username: userData['username'],
            createdAt: userData['createdAt']));
  } catch (e) {
    rethrow;
  }
}
