import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/auth.dart';
import 'package:njha_bird_detect/app/models/history.dart';
import 'package:njha_bird_detect/app/shared/services/auth_services.dart';
import 'package:njha_bird_detect/app/shared/utils/storage.dart';
import 'package:njha_bird_detect/app/shared/widgets/toast.dart';

class AuthProvider extends ChangeNotifier {
  Auth? _auth = Auth();
  Auth? get auth => _auth;

  List<History>? _histories = [];
  List<History>? get histories => _histories;

  final _formKeySignIn = GlobalKey<FormState>();
  GlobalKey<FormState> get formKeySignIn => _formKeySignIn;

  final _formKeySignUp = GlobalKey<FormState>();
  GlobalKey<FormState> get formKeySignUp => _formKeySignUp;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  AuthProvider() {
    checkAuth();
  }

  checkAuth() async {
    final accessToken = await getLocalStorage('accessToken');
    final accountData = await getLocalStorage('account');
    if (accountData != null && accessToken != null) {
      var user = jsonDecode(accountData);
      var userData = UserData.fromJson(user);
      _auth = Auth(accessToken: accessToken, userData: userData);
    }
  }

  /* Register Function */
  Future<void> register(context) async {
    if (_formKeySignUp.currentState!.validate()) {
      try {
        final newAccount = {
          "email": _emailController.text,
          "username": _usernameController.text,
          "password": _passwordController.text,
          "role": 2
        };
        final Auth? accountData = await registerAccount(newAccount);
        _auth = accountData;
        if (accountData?.accessToken != null &&
            accountData?.userData?.id != null) {
          await setLocalStorage(
              'account', json.encode(_auth?.userData?.toMap()));
          await setLocalStorage('accessToken', _auth?.accessToken);
        }
        showToast(context, "Register Successfully");
        Navigator.pop(context);
        clearInput();
        notifyListeners();
      } catch (e) {
        showToast(context, e.toString());
        debugPrint("Error in register provider:  $e");
      }
    }
  }

  Future<void> getHistoriesData() async {
    try {
      if (auth?.accessToken != null) {
        final List<History>? historiesData = await getHistories();
        _histories = historiesData;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error in get history provider:  $e");
    }
  }

  Future<void> deleteHistoryUser(int id) async {
    try {
      if (auth?.accessToken != null) {
        final bool deleted = await deleteHistory(id);
        if (deleted == true) {
          await getHistoriesData();
        }
      }
    } catch (e) {
      debugPrint("Error in delete history provider:  $e");
    }
  }

  Future<void> login(context) async {
    try {
      if (_formKeySignIn.currentState!.validate()) {
        final loginInfo = {
          "email": _emailController.text,
          "password": _passwordController.text
        };
        final Auth? accountData = await loginAccount(loginInfo);
        _auth = accountData;
        if (_auth?.accessToken != null) {
          await setLocalStorage(
              'account', json.encode(_auth?.userData?.toMap()));
          await setLocalStorage('accessToken', _auth?.accessToken);
          showToast(context, "Login Successfully");
          Navigator.pop(context);
          clearInput();
        }
        notifyListeners();
      }
    } catch (e) {
      showToast(context, e.toString());
      debugPrint("Error in login provider $e");
    }
  }

  clearInput() {
    _emailController.clear();
    _usernameController.clear();
    _passwordController.clear();
    notifyListeners();
  }

  logout() async {
    await removeLocalStorage('accessToken');
    await removeLocalStorage('account');
    _auth = Auth();
    notifyListeners();
  }
}
