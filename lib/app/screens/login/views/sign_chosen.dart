import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget signChosen(BuildContext context,onTap) {
  return Row(
    children: [
      const Text(
        "You Don Not Have an email ?",
        style: TextStyle(fontSize: 20),
      ),
      const SizedBox(
        width: 10,
      ),
      GestureDetector(
        onTap: () {
          onTap;
         // navigateToSignUp(context);
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.blue, fontSize: 24),
        ),
      ),
    ],
  );
}
