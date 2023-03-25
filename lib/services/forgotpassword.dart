import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_page/pages/login_pages/login_page_fill.dart';

import '../component/login_components/sign_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final forgotcontroller = TextEditingController();
  @override
  void dispose() {
    forgotcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future passwordreset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgotcontroller.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                iconColor: Colors.white,
                backgroundColor: Colors.green,
                icon: Icon(Icons.check_circle),
                title: Text(
                  "Reset Link Sent! Check Your Email",
                  style: TextStyle(color: Colors.white),
                ));
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                iconColor: Colors.white,
                backgroundColor: Colors.red,
                icon: Icon(Icons.no_accounts),
                title: Text(
                  "Error",
                  style: TextStyle(color: Colors.white),
                ));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 238, 224),
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 250),
          child: Column(
            children: [
              Text(
                'Password Reset Link will be sent to KIIT Mail',
                style: TextStyle(
                    color: Color.fromARGB(255, 17, 41, 23),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              LoginFill(
                  controller: forgotcontroller,
                  hinttext: "Enter your E-mail",
                  obsecuretext: false),
              SizedBox(
                height: 30,
              ),
              SignButton(
                onTap: () {
                  passwordreset();
                },
                buttontext: 'Sent Link',
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
