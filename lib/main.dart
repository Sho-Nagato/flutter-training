import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  static String _message = "OK";
  static int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
      ),
      body: Column(
        children: [
          Text(
            _message,
            style: const TextStyle(
              fontSize: 32.0
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              ListTile(
                leading: const Icon(Icons.android, size:32),
                title: const Text("first item", style: TextStyle(fontSize: 28.0)),
                selected: _index == 1,
                onTap: () {
                  _index = 1;
                  tapTile();
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite, size:32),
                title: const Text("second item", style: TextStyle(fontSize: 28.0)),
                selected: _index == 2,
                onTap: () {
                  _index = 2;
                  tapTile();
                },
              ),
              ListTile(
                leading: const Icon(Icons.home, size:32),
                title: const Text("Third item", style: TextStyle(fontSize: 28.0)),
                selected: _index == 3,
                onTap: () {
                  _index = 3;
                  tapTile();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void tapTile() {
    setState(() {
      _message = "you tapped: No, $_index";
    });
  }
}