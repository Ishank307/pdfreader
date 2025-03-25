import 'dart:io';
// Import the generated file
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pdfreader/auth/checkuser.dart';
import 'package:pdfreader/auth/signup.dart';

import 'firebase_options.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdfreader/auth/login.dart';
import 'package:pdfreader/helper/uihelper.dart';
import 'package:pdfreader/pdfall/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Checkuser(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // File? file;

  // void filePicker() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     file = File(result.files.single.path!);
  //     setState(() {});
  //   } else {}
  // }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  // }
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // body: file != null ? SfPdfViewer.file(file!) : Text("Not found"),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: filePicker,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.file_open_sharp),
      // ),
    );
  }
}
