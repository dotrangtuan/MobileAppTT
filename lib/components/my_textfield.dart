import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final bool isValid;



  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.isValid
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    if (isValid) {
      color = Colors.black;
    } else {
      color = Colors.red;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(

        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 48, 20),
          labelText: hintText,
          labelStyle: TextStyle(
            color: Colors.grey.shade800
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: color), // Đổi màu border tại đây
          ),
          // enabledBorder: const OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.white)
          // ),

          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color, width: 2)
          ),
          // fillColor: Colors.grey.shade200,
          // filled: true,
          // hintText: hintText,
          // hintStyle: TextStyle(color: Colors.grey[500])

        ),
        controller: controller,
        obscureText: obscureText,
      ),
    );
  }

}