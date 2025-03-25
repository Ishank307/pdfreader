import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdfreader/auth/login.dart';
import 'package:pdfreader/helper/uihelper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  signup(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Uihelper.customAlertBox(context, "Enter the Required Fields");
    }
    UserCredential userCredential;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyloginPage()),
      );
    } on FirebaseAuthException catch (ex) {
      Uihelper.customAlertBox(context, ex.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelper.customTextField(
            _emailController,
            "Email",
            Icons.email,
            false,
          ),
          Uihelper.customTextField(
            _passwordController,
            "Password",
            Icons.password,
            true,
          ),

          ElevatedButton(
            onPressed: () {
              signup(_emailController.text, _passwordController.text);
            },
            child: Text("SignUp"),
          ),
        ],
      ),
    );
  }
}
