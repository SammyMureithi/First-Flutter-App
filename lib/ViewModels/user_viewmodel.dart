// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../Models/user_model.dart' as UserModel;

class UserViewModel extends ChangeNotifier {
  List<UserModel.UserModel> _users = [];
  bool _isLoading = false;

  List<UserModel.UserModel> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();
    Fluttertoast.showToast(
        msg: "Fetching Users... ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      final List<dynamic> data = jsonDecode(response.body);
      final List<UserModel.UserModel> loadedData = [];
      data.forEach((user) {
        loadedData.add(UserModel.UserModel.fromJson(user));
      });
      _users = loadedData;
      _isLoading = false;
      notifyListeners();
    } else {
      Fluttertoast.showToast(
          msg: "Failed To Fetch Users...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  String get name => _users.first.name;
  String get email => _users.first.email;
}
