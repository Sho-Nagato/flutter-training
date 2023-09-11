import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage(),);
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
  final TextEditingController _controller = TextEditingController();
  final String _fileName = "assets/documents/data.txt";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Resource File Access",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:32.0,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"
                ),
              ),
            ),

            TextField(
              controller: _controller,
              style: const TextStyle(fontSize: 20.0),
              minLines: 1,
              maxLines: 5,
            ),

            const Padding(
              padding: EdgeInsets.only(top:10.0)
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: loadButtonPressed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red
                  ),
                  child: const Text("Load", style: TextStyle(fontSize: 20.0),)
                )
              ),
            ),
          ]
        ),
      ),
    );
  }

  void loadButtonPressed() async {
    String value = await loadIt();
    setState(() {
      _controller.text = value;
    });
    if (!context.mounted) return;
    showDialog(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          title: Text("loaded!!"),
          content: Text("load message from Assets."),
        ));
  }

  Future<String> getDataAssets(String path) async {
    String value = await rootBundle.loadString(path);
    return value;
  }

  Future<String> loadIt() async {
    try {
      final res = await getDataAssets(_fileName);
      return res;
    } catch (e) {
      return "*** no data ***";
    }
  }
}