import 'dart:convert';

import 'package:njha_bird_detect/app/models/history.dart';

class Auth {
  String? accessToken;
  UserData? userData;

  Auth({this.accessToken, this.userData});

  Auth.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    if (userData != null) {
      data['data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? email;
  String? username;
  String? createdAt;
  int? id;
  List<History>? histories;

  UserData(
      {this.email, this.username, this.createdAt, this.id, this.histories});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    createdAt = json['createdAt'];
    id = json['id'];
    if (json['histories'] != null) {
      histories = <History>[];
      json['histories'].forEach((v) {
        histories?.add(History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['createdAt'] = createdAt;
    data['id'] = id;
    if (histories != null) {
      data['histories'] = histories!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // Convert the User object to a Map
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'createdAt': createdAt,
      'id': id,
      'histories': histories
    };
  }

  // Create a User object from a Map
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
        username: map['username'],
        email: map['email'],
        createdAt: map['createdAt'],
        id: map['id'],
        histories: map['histories']);
  }
}
