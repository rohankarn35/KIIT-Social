import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/pages/login_pages/login_or_register.dart';

class ErrorMessageField extends StatelessWidget {
   ErrorMessageField({super.key});

      final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              Text("Login or Sign Up with Kiit ID only"),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: ()async {
                print("Here");
                 await googleSignIn.signOut().
                 then((value)async => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginOrRegister(),)));
              
              }, child: Text("Back to Login"))
            
            ],
          ),
        ),
      ),
    );
  }
}