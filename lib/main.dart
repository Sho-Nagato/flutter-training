import 'dart:convert';
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
  static String host = "baconipsum.com";
  static String path = "/api/?type=meat-and-filler&paras=1&format=text";
  static String getUri = "https://baconipsum.com/api/?type=meat-and-filler&paras=1&format=text";
  static String postUri = "https://jsonplaceholder.typicode.com/posts";

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
                "Network Access",
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
              maxLines: 10,
            ),

            const Padding(
              padding: EdgeInsets.only(top:10.0)
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: getHttpButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: const Text("HTTP (Get)", style: TextStyle(fontSize: 20.0),)
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: getHttpsButtonPressed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  child: const Text("HTTPS (Get)", style: TextStyle(fontSize: 20.0),)
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: postHttpsButtonPressed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  child: const Text("HTTPS (Post)", style: TextStyle(fontSize: 20.0),)
                )
              ),
            ),
          ]
        ),
      ),
    );
  }

  void getHttpButtonPressed() async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.get(host, 80, path);
    HttpClientResponse response = await request.close();
    final String value = await response.transform(utf8.decoder).join();
    _controller.text = value;
  }

  void getHttpsButtonPressed() async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(getUri));
    HttpClientResponse response = await request.close();
    final String value = await response.transform(utf8.decoder).join();
    _controller.text = value;
  }

  void postHttpsButtonPressed() async {
    final ob = {
      "title":"foo",
      "author":"flutter",
      "content":"this is sample content."
    };

    final jsonData = json.encode(ob);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(postUri));
    request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    request.write(jsonData);
    HttpClientResponse response = await request.close();
    final String value = await response.transform(utf8.decoder).join();
    _controller.text = value;
  }
}