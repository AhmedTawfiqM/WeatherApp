import 'package:flutter/cupertino.dart';
import 'package:roaa_weather/common/data/shared_pref/data_keys.dart';
import 'package:roaa_weather/common/data/shared_pref/shar_pref.dart';
import 'package:roaa_weather/common/data/shared_pref/shared_pref_helper.dart';
import 'package:roaa_weather/common/presentation/screens/login/login_screen.dart';
import 'package:roaa_weather/common/presentation/screens/weather/weather_screen.dart';

class AppRoute {
  widget() {
    var isLogin = SharedPrefHelper().isLogin();
    if (isLogin) {
      return WeatherScreen();
    }

    return LogInScreen();
  }
}
