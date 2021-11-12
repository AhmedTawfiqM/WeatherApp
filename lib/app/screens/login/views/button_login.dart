import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/core/state/resource_state.dart';

Widget buttonLogin(state, cubit,onPressed) {

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
    ),
    width: double.infinity,
    height: 50,
    child: state is ResourceLoadingState
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : ElevatedButton(
        onPressed: () {
          onPressed;
          // if (formKey.currentState!.validate()) {
          //   cubit.logIn(email: email.text, password: password.text);
          // }
        },
        child: const Text("Log In")),
  );
}
