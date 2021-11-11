import 'package:roaa_weather/app/screens/login/login_screen.dart';
import 'package:roaa_weather/app/screens/weather/weather_screen.dart';
import 'package:roaa_weather/common/data/shared_pref/shared_pref_helper.dart';

class AppRoute {
  widget() {
    var isLogin = SharedPrefHelper().isLogin();
    if (isLogin) {
      return WeatherScreen();
    }

    return LogInScreen();
  }
}
