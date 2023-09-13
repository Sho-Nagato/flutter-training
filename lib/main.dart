/*
1. Firebaseのアカウントを作成（GoogleアカウントがあればOK）

2. Firebase CLIのインストール（https://firebase.google.com/docs/cli?hl=ja）

3. FlutterプロジェクトにFirebaseパッケージをインストール & アップデート
   ・flutter pub add firebase_core
   ・flutter pub upgrade firebase_core

4. Flutterプロジェクトにcloud_firestoreパッケージをインストール & アップデート
   ・flutter pub add cloud_firestore
   ・flutter pub upgrade cloud_firestore

5. Firebaseプロジェクトを作成

6. コレクション、ドキュメントを作成

7. FlutterプロジェクトにFirebaseの設定
   ・dart pub global activate flutterfire_cli
   ・flutterfire configre
     - プロジェクトの選択
     - プラットフォームの選択（Android）
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
                  onPressed: findAll,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: const Text("Find All", style: TextStyle(fontSize: 20.0),)
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: findByName,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: const Text("Find By Name", style: TextStyle(fontSize: 20.0),)
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: findByNameLike,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  child: const Text("Find By Name Like", style: TextStyle(fontSize: 20.0),)
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child:  ElevatedButton(
                  onPressed: () {
                    _controller.text = "";
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                  ),
                  child: const Text("Text Field Clear", style: TextStyle(fontSize: 20.0),)
                )
              ),
            ),
          ]
        ),
      ),
    );
  }

  void findAll() async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final snapshot = await fireStore.collection("mydata").get();
    String msg = "";
    for (var element in snapshot.docChanges) {
      String name = element.doc.get("name");
      String mail = element.doc.get("mail");
      int age = element.doc.get("age");
      msg += "$name ($age) $mail\n";
    }
    _controller.text = msg;
  }

  void findByName() async {
    String msg = _controller.text;
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final snapshot = await fireStore.collection("mydata").where("name", isEqualTo: msg).get();
    for (var element in snapshot.docChanges) {
      String name = element.doc.get("name");
      String mail = element.doc.get("mail");
      int age = element.doc.get("age");
      msg += "\n$name ($age) $mail";
    }
    _controller.text = msg;
  }

  void findByNameLike() async {
    String msg = _controller.text;
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final snapshot = await fireStore.collection("mydata")
        .orderBy("name", descending: false)
        .startAt([msg])
        .endAt(["$msg\uf8ff"])
        .get();
    for (var element in snapshot.docChanges) {
      String name = element.doc.get("name");
      String mail = element.doc.get("mail");
      int age = element.doc.get("age");
      msg += "\n$name ($age) $mail";
    }
    _controller.text = msg;
  }
}