import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Flutter!!'),
        ),
        body: const Text(
          'Hello Flutter World!!',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}