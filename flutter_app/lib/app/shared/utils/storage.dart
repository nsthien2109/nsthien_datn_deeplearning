import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamic setLocalStorage(key, dynamic value) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences preferences = await prefs;
  debugPrint('Set $key equals to : $value');
  return preferences.setString(key, value);
}

dynamic getLocalStorage(key) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences preferences = await prefs;
  return preferences.get(key);
}

Future removeLocalStorage(key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.remove(key);
}

Future resetStorage() async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences preferences = await prefs;
  return preferences.clear();
}
