import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Floating Action Button",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black45,
      ),

    );
  }
}
