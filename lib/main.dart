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
  int price;
  String name;
  Data(this.name, this.price): super();

  @override
  String toString() {
    return '$name : $price円';
  }
}

class _MyHomePageState extends State<MyHomePage> {
  static final data = [
    Data('Apple', 200),
    Data('Orange', 150),
    Data('Peach', 300),
    Data('Grape', 250)
  ];
  Data item = data[0];

  void setMessage() {
    setState(() {
      item = (data..shuffle()).first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        item.toString(),
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