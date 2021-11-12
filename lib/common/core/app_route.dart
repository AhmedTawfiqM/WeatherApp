import 'package:weather_app/app/screens/login/login_screen.dart';
import 'package:weather_app/app/screens/weather/weather_screen.dart';
import 'package:weather_app/common/data/shared_pref/shared_pref_helper.dart';

class AppRoute {
  widget() {
    var isLogin = SharedPrefHelper().isLogin();
    if (isLogin) {
      return WeatherScreen();
    }

    return LogInScreen();
  }
}
