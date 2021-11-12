import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({required this.controller,required this.onPressed, required this.onFieldSubmitted});

  final TextEditingController controller;
  final Function onPressed;
  final Function onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width - 30,
      child: TextFormField(
          controller: controller,
          validator: (v) {
            if (v.toString().isEmpty) {
              return "Search can not be empty"; //TODO: localize
            } else {}
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepOrange),
                borderRadius: BorderRadius.circular(20)),
            focusColor: Colors.black,
            labelText: "Search For Your Country Weather",  //TODO: localize
            labelStyle: const TextStyle(fontSize: 20),
            suffix: IconButton(
              onPressed: () {
                onPressed;
              },
              icon: const Icon(Icons.search),
            ),
          ),
          onFieldSubmitted: (v) {
            onFieldSubmitted;
          },
          keyboardType: TextInputType.emailAddress),
    );
  }
}
