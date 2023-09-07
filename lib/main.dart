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
  static String _message = "";

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
              padding: EdgeInsets.all(10.0),
            ),

            ElevatedButton(
              onPressed: buttonPressed,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Tap me!!",
                  style: TextStyle(
                    fontSize:32.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"
                  ),
                ),
              )
            )
          ]
        ),
      ),
    );
  }

  void buttonPressed(){
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: const Text("Select assignment"),
        children: [
          SimpleDialogOption(
            child: const Text("One"),
            onPressed: () => Navigator.pop<String>(context, "One"),
          ),
          SimpleDialogOption(
            child: const Text("Two"),
            onPressed: () => Navigator.pop<String>(context, "Two"),
          ),
          SimpleDialogOption(
            child: const Text("Three"),
            onPressed: () => Navigator.pop<String>(context, "Three"),
          ),
        ],
      )
    ).then<void>((value) => resultAlert(value));
  }

  void resultAlert(String value) {
    setState(() {
      _message = "selected : $value";
    });
  }
}