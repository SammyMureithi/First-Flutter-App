// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/user_model.dart' as UserModel;

class UserViewModel extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<UserModel.UserModel> _users = [];

  List<UserModel.UserModel> get users => _users;

  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<UserModel.UserModel> loadedData = [];
      data.forEach((user) {
        loadedData.add(UserModel.UserModel.fromJson(user));
      });
      _users = loadedData;
      // print(_users.length);
    } else {
      throw Exception("Failed to Load Users");
    }
  }

  String get name => _users.first.name;

  String get email => _users.first.email;
}
