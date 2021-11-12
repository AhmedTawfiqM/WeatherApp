import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/common/presentation/widgets/app_text_form_field.dart';

Widget textFieldsLogin(BuildContext context, cubit, email, password) {
  return Column(
    children: [
      Center(
        child: Text(
          "Login",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      const SizedBox(
        height: 60,
      ),
      appTextFormField(
          controller: email,
          obsure: false,
          label: "Your Email",
          onSaved: (v) {},
          validate: (v) {
            if (v.toString().isEmpty) {
              return "email can not be empty";
            } else if (!v.toString().contains("@")) {
              return "Not Correct Email";
            } else {}
          },
          prefix: const Icon(Icons.event_note),
          type: TextInputType.emailAddress),
      const SizedBox(
        height: 40,
      ),
      appTextFormField(
        controller: password,
        obsure: cubit.isVisible,
        label: "Your Password",
        onSaved: (v) {},
        validate: (v) {
          if (v.toString().isEmpty) {
            return "Password can not be empty";
          } else if (v.toString().length < 6) {
            return "Not Strong Password";
          } else {}
        },
        prefix: const Icon(Icons.ac_unit),
        suffix: IconButton(
          icon: Icon(cubit.isVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            cubit.changeVisibility();
          },
        ),
        type: TextInputType.number,
      ),
      const SizedBox(
        height: 30,
      ),
    ],
  );
}
