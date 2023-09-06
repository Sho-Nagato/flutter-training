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
  static String _selected = "A";

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize:32.0,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(10.0)
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio<String>(
                  value: "A",
                  groupValue: _selected,
                  onChanged: checkChanged,
                ),
                const Text(
                  "radio A",
                  style: TextStyle(
                    fontSize:28.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"
                  )
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio<String>(
                  value: "B",
                  groupValue: _selected,
                  onChanged: checkChanged,
                ),
                const Text(
                  "radio B",
                  style: TextStyle(
                    fontSize:28.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"
                  )
                )
              ]
            ),
          ]
        ),
      ),
    );
  }

  void checkChanged(String? value) {
    setState(() {
      _selected = value ?? "no data";
      _message = "select: $_selected";
    });
  }
}