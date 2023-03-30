// ignore_for_file: prefer_const_constructors, unnecessary_const, unused_field

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Test(),
  ));
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // ignore: prefer_final_fields
  int _number = 1;
  void handleClick() {
    setState(() {
      _number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text("Number $_number"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClick,
        child: Text('Add'),
      ),
    );
  }
}
