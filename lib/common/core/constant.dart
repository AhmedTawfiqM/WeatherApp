   import 'package:flutter/material.dart';

ThemeData theme =ThemeData(
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 40,
    ),
  ),
);


customShowDialog(BuildContext context,String text){
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
        );
      });

}




