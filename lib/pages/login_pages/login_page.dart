import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/pages/homepage.dart';
import 'package:login_page/pages/login_pages/ErrorField.dart';
import 'package:login_page/pages/login_pages/auth_page.dart';
import 'package:login_page/pages/login_pages/login_or_register.dart';
import 'package:login_page/pages/login_pages/login_page_fill.dart';
import 'package:login_page/component/login_components/sign_button.dart';
import 'package:login_page/services/auth_service.dart';

import '../../services/forgotpassword.dart';

class LOginPage extends StatefulWidget {
  final Function()? onTap;
  LOginPage({super.key, required this.onTap});

  @override
  State<LOginPage> createState() => _LOginPageState();
}

class _LOginPageState extends State<LOginPage> {
  Future hidestatus() => SystemChrome.setEnabledSystemUIOverlays([]);

  final GoogleSignIn googleSignIn = GoogleSignIn();

  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  void singUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  iconColor: Colors.white,
                  backgroundColor: Colors.red,
                  icon: Icon(Icons.no_accounts),
                  title: Text(
                    'Wrong Email',
                    style: TextStyle(color: Colors.white),
                  ));
            });
      } else if (e.code == 'wrong-password') {
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  iconColor: Colors.white,
                  backgroundColor: Colors.red,
                  icon: Icon(
                    Icons.no_accounts,
                    size: 30,
                  ),
                  title: Text(
                    'Wrong Password',
                    style: TextStyle(color: Colors.white),
                  ));
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 238, 224),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school_outlined,
                    size: 100,
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "KIIT Social",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Welcome Back KIITian",
                    style: TextStyle(
                        color: Color.fromARGB(255, 73, 77, 74),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginFill(
                    hinttext: 'Enter your KIIT Mail',
                    obsecuretext: false,
                    controller: emailcontroller,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  LoginFill(
                    hinttext: 'Enter your password',
                    obsecuretext: true,
                    controller: passwordcontroller,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgotPasswordPage();
                            }));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.black38,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SignButton(
                    onTap: () {
                      if(emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty){
                      singUserIn();
                            
                      }
                      else{
                        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  iconColor: Colors.white,
                  backgroundColor: Colors.red,
                  icon: Icon(
                    Icons.error_outline_outlined,
                    size: 30,
                  ),
                  title: Text(
                    'Email or Password not entered',
                    style: TextStyle(color: Colors.white),
                  ));
            });
                      }
                     
                    },
                    buttontext: 'Sign In',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black38,
                        ),
                      ),
                      Text(
                        "Continue with",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(
                            color: Color.fromARGB(115, 102, 105, 102)),
                        borderRadius: BorderRadius.circular(8)),
                    // color: Colors.white,
                    child: GestureDetector(
                      onTap: () async{
                        
                //         if(await FirebaseAuth.instance.currentUser!=null){
                //           {
                //             if(await FirebaseAuth.instance.currentUser!.email!.contains("@kiit.ac.in")){
                //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage(),));
                //             }else{
                //               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ErrorMessageField(),));
                //                 // await googleSignIn.signOut().
                // //  then((value)async =>await FirebaseAuth.instance.signOut().  then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => (),))));
                //             }
                //           }

                //         }else{
                //         AuthService().signInWithGoogle();
                //         }


                  var res = await  AuthService().signInWithGoogle();
                      if(res){
                        print("User is valid");
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage(),));
                      }else{
                        print("User is invalid");
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ErrorMessageField(),));
                        // await googleSignIn.signOut();
                      }
                      },
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New to The Social?'),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
