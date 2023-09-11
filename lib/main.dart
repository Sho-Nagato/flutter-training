import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                "Shared Preferences Access",
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
                  onPressed: saveButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: const Text("Save", style: TextStyle(fontSize: 20.0),)
                )
              ),
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

  void saveButtonPressed() async {
    savePref();
    showDialog(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        title: Text("saved!!"),
        content: Text("save message to Shared Preferences."),
      )
    );
  }

  void loadButtonPressed() async {
    loadPref();
    showDialog(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        title: Text("loaded!!"),
        content: Text("load message from Shared Preferences."),
      )
    );
  }

  void savePref() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("input", _controller.text);
    setState(() {
      _controller.text = "";
    });
  }

  void loadPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _controller.text = prefs.getString("input") ?? "";
    });
  }
}