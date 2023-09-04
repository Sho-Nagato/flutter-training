import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: 'Flutterサンプル',
        message: 'サンプル・メッセージ',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final String message;

  const MyHomePage({
    Key? key,
    required this.title,
    required this.message
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        widget.message,
        style: const TextStyle(fontSize: 25.0),
      ),
    );
  }
}