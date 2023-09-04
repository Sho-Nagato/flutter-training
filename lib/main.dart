import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final title = 'Flutterサンプル';
  final message = 'サンプル・メッセージ';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: title,
        message: message,
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