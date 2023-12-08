import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/auth.dart';
import 'package:njha_bird_detect/app/shared/services/auth_services.dart';
import 'package:njha_bird_detect/app/shared/utils/storage.dart';

class AuthProvider extends ChangeNotifier {
  Auth? _auth = Auth();
  Auth? get auth => _auth;

  final _formKeySignUp = GlobalKey<FormState>();
  GlobalKey<FormState> get formKeySignUp => _formKeySignUp;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  /* Register Function */
  Future<void> register(context) async {
    if (_formKeySignUp.currentState!.validate()) {
      try {
        final newAccount = <String, dynamic>{
          "email": _emailController.text,
          "username": _usernameController.text,
          "password": _passwordController.text,
          "role": 2
        };
        final Auth? accountData = await registerAccount(newAccount);
        _auth = accountData;
        if (accountData?.accessToken != null &&
            accountData?.userData?.id != null) {
          await setLocalStorage('account', _auth?.userData);

          await setLocalStorage('accessToken', _auth?.accessToken);
        }
        notifyListeners();
      } catch (e) {
        notifyListeners();
        debugPrint("Error in register provider:  $e");
      }
    }
  }
}
