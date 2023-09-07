import 'package:flutter/material.dart';

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
  static int _count = 0;

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
                "$_count",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize:32.0,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _count++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  child: const Text("プラス", style: TextStyle(fontSize: 20.0),)
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  width: double.infinity,
                  child:  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                    ),
                    child: const Text("マイナス", style: TextStyle(fontSize: 20.0),)
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  width: double.infinity,
                  child:  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count *= 2;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber
                    ),
                    child: const Text("2倍", style: TextStyle(fontSize: 20.0),)
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  width: double.infinity,
                  child:  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                    ),
                    child: const Text("クリア", style: TextStyle(fontSize: 20.0),)
                  )
              ),
            ),
          ]
        ),
      ),
    );
  }
}