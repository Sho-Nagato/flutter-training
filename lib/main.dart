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
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  static final _controller = TextEditingController();
  const FirstScreen({super.key});

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
                  "First Screen",
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
                style: const TextStyle(fontSize: 28.0),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(_controller.text)
                      )
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Next Screen",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
              )
            ]
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String _value;

  const SecondScreen(this._value, {super.key});

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
                  "Second Screen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:32.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"
                  ),
                ),
              ),
              Text(
                "you typed : $_value",
                style: const TextStyle(fontSize: 28.0),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Previous Screen",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              )
            ]
        ),
      ),
    );
  }
}