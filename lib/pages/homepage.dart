import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/pages/login_pages/login_or_register.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final user = FirebaseAuth.instance.currentUser;
final GoogleSignIn googleSignIn = GoogleSignIn();
//   static Future<void> signOut({required BuildContext context}) async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     try {
//       if (!kIsWeb) {
//         await googleSignIn.signOut();
//       }
//       await FirebaseAuth.instance.signOut();
//     } on FirebaseAuthException catch (e) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//                 iconColor: Colors.white,
//                 backgroundColor: Colors.red,
//                 icon: Icon(Icons.no_accounts),
//                 title: Text(
//                   e.code,
//                   style: TextStyle(color: Colors.white),
//                 ));
//           });
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 238, 224),
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: ()async {
                // signOut(context: context);
                 await googleSignIn.signOut().
                 then((value)async =>await FirebaseAuth.instance.signOut().  then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginOrRegister(),))));
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello  ${user!.email}"),
          SizedBox(
            height: 30,
          ),
          Text('App Under Development...')
        ],
      )),
    );
  }
}
