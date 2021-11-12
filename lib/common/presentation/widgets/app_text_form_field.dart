import 'package:flutter/material.dart';

//TODO: implement
// class AppTextFormField extends StatelessWidget {
//   const AppTextFormField({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

//TODO: move to class
Widget appTextFormField(
    {required bool obsure,
      required TextInputType type,
      FormFieldSetter? onSaved,
      FormFieldValidator? validate,
      required String label,
      TextEditingController? controller,
      Widget? prefix,
      Widget? suffix}) {
  return TextFormField(
    controller: controller,
    obscureText: obsure,
    onSaved: onSaved,
    validator: validate,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      focusColor: Colors.black,
      labelText: label,
      labelStyle: TextStyle(fontSize: 25),
      prefixIcon: prefix,
      suffixIcon: suffix,
    ),
    keyboardType: type,
  );
}
