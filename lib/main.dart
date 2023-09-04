import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final title = 'Flutterサンプル';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class Data {
  String message;
  Data(this.message): super();

  @override
  String toString() {
    return message;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Data data = Data("Hello!!");

  void setMessage() {
    setState(() {
      data = Data('タップしました!!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        data.toString(),
        style: const TextStyle(fontSize: 25.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: setMessage,
        tooltip: 'Set Message',
        child: const Icon(Icons.star),
      ),
    );
  }
}