import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/screens/login/views/button_login.dart';
import 'package:weather_app/app/screens/login/views/sign_chosen.dart';
import 'package:weather_app/app/screens/login/views/text_fields_login.dart';
import 'package:weather_app/app/screens/register/register_screen.dart';
import 'package:weather_app/app/screens/weather/weather_screen.dart';
import 'package:weather_app/common/core/constant.dart';
import 'package:weather_app/common/core/state/resource_state.dart';
import 'package:weather_app/common/data/shared_pref/data_keys.dart';
import 'package:weather_app/common/data/shared_pref/shar_pref.dart';
import 'package:weather_app/common/presentation/shared/cubit/authentication_cubit.dart';

class LogInScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, ResourceState>(listener: (context, state) {
      if (state is ResourceErrorState) {
        customShowDialog(context, state.error);
      }

      if (state is ResourceSucceedState) {
        saveIdThenNavigate(context, state.uId);
      }
    }, builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  textFieldsLogin(context, cubit, email, password),
                  buttonLogin(state, cubit, () {
                    if (formKey.currentState!.validate()) {
                      cubit.logIn(email: email.text, password: password.text);
                    }
                  }),
                  const SizedBox(
                    height: 40,
                  ),
                  signChosen(context, () {
                    navigateToSignUp(context);
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  saveIdThenNavigate(BuildContext context, String id) {
    AppSharedPref.putData(key: PrefKey.userId, value: id);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen();
    }));
  }

  navigateToSignUp(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpScreen()));
  }
}
