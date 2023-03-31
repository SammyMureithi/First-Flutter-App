import 'package:flutter/material.dart';
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

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
              itemCount: viewModel.users.length,
              itemBuilder: (context, index) {
                final user = viewModel.users[index];
                return ListTile(
                  title: Text("Name :${user.name}"),
                  subtitle: Text("Email :${user.email}"),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.fetchUsers();
        },
        child: Text('Fetch'),
      ),
    );
  }
}
