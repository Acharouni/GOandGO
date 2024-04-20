import 'package:flutter/material.dart';

class startScreen extends StatefulWidget {
  const startScreen({Key? key}) : super(key: key);

  @override
  State<startScreen> createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,


      ),
      body: Container(
        width:double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF232D4B),Color(0xFF005573)],
              begin:Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),

      ),

    );
  }
}