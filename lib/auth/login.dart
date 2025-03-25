import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdfreader/auth/signup.dart';
import 'package:pdfreader/helper/uihelper.dart';
import 'package:pdfreader/pdfall/pdf.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

class MyloginPage extends StatefulWidget {
  const MyloginPage({super.key});

  @override
  State<MyloginPage> createState() => _MyloginPageState();
}

class _MyloginPageState extends State<MyloginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Uihelper.customAlertBox(context, "Enter the required fields");
    } else {
      UserCredential userCredential;
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (!mounted) return;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Pdf()));
      } on FirebaseAuthException catch (ex) {
        if (!mounted) return;
        Uihelper.customAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page"), centerTitle: true),
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
          Uihelper.customButton(() {
            login(_emailController.text, _passwordController.text);
          }, "Login"),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                child: Text("SignUp"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
