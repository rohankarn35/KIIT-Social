import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginFill extends StatelessWidget {
  final controller;
  final String hinttext;
  final bool obsecuretext;

  LoginFill(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.obsecuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        obscureText: obsecuretext,
        controller: controller,
        cursorColor: Color.fromARGB(255, 24, 56, 24),
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.black12),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: Color.fromARGB(115, 216, 243, 215))),
          focusedBorder: OutlineInputBorder(
            gapPadding: 3.0,
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          fillColor: Color.fromARGB(255, 243, 240, 240),
          filled: true,
        ),
      ),
    );
  }
}
