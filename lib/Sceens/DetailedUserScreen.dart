import 'package:flutter/material.dart';
import 'package:test1/Models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailedUserScreen extends StatelessWidget {
  const DetailedUserScreen({Key? key, required this.user}) : super(key: key);
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${user.name}"),
            Text("Username: ${user.username}"),
            Text("Email: ${user.email}"),
            Text("Phone: ${user.phone}"), //address,website,company
            Text("Address:  ${user.address.street}"),
            Text("Company: ${user.company.name}"),
            Text("Website: ${user.website}"),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Fluttertoast.showToast(
              msg: "${user.name} is Active",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        child: Text(user.username),
      ),
    );
  }
}
