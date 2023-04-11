// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test1/Sceens/DetailedUserScreen.dart';
import './ViewModels/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: MaterialApp(
        home: Test(),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  late UserViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<UserViewModel>(context, listen: false);
    _viewModel.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: viewModel.users.length,
              itemBuilder: (context, index) {
                final user = viewModel.users[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedUserScreen(user: user),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      title: Text("Name :${user.name}"),
                      subtitle: Text("Email :${user.email}"),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.fetchUsers,
        child: Text('Fetch'),
      ),
    );
  }
}
