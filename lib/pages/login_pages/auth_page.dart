import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/pages/login_pages/ErrorField.dart';
import 'package:login_page/pages/login_pages/login_or_register.dart';
import 'package:login_page/pages/login_pages/login_page.dart';

import '../homepage.dart';

class AuthPage extends StatelessWidget {
   AuthPage({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);

          var data = snapshot.data;
          var emails = data!.email;
          var check = emails!.contains("@kiit.ac.in");
          if(check){ 
            return Homepage();
          }
             return ErrorMessageField();
         
        } else {
          return LoginOrRegister();
        }
      },
    ));
  }
}
