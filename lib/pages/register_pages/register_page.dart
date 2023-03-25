import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../component/login_components/sign_button.dart';
import '../../services/auth_service.dart';
import '../login_pages/login_page_fill.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  void singUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    try {
      if (passwordcontroller.text == confirmpasswordcontroller.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text);
        Navigator.pop(context);
      } else {
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  icon: Icon(
                    Icons.error,
                    size: 30,
                  ),
                  iconColor: Colors.white,
                  backgroundColor: Colors.red,
                  title: Text(
                    "Passwords don't match",
                    style: TextStyle(color: Colors.white),
                  ));
            });
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                iconColor: Colors.white,
                backgroundColor: Colors.red,
                icon: Icon(Icons.no_accounts),
                title: Text(
                  e.code,
                  style: TextStyle(color: Colors.white),
                ));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 238, 224),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 30),
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
                    "The Social",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(
                        color: Color.fromARGB(255, 73, 77, 74),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginFill(
                    hinttext: 'Enter your E-Mail',
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
                    height: 15,
                  ),
                  LoginFill(
                    hinttext: 'Confirm your password',
                    obsecuretext: true,
                    controller: confirmpasswordcontroller,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SignButton(
                    onTap: () {
                      singUserUp();
                    },
                    buttontext: 'Sign Up',
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
                      onTap: () => AuthService().signInWithGoogle(),
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
                      Text('Already have an account?'),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Login Now',
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
