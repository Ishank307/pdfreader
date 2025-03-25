import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdfreader/auth/login.dart';
import 'package:pdfreader/pdfall/pdf.dart';

class Checkuser extends StatefulWidget {
  const Checkuser({super.key});

  @override
  State<Checkuser> createState() => _CheckuserState();
}

class _CheckuserState extends State<Checkuser> {
  Widget currentpage = Scaffold(
    body: Center(child: CircularProgressIndicator()),
  );
  @override
  void initState() {
    super.initState();
    checkuser();
  }

  checkuser() async {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      if (user != null) {
        currentpage = Pdf();
      } else {
        currentpage = MyloginPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentpage;
  }
}
