import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roaa_weather/common/data/domain/weather/weather_repo.dart';
import 'package:roaa_weather/common/data/models/weather/country_weather.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepo weatherRepo;

  WeatherViewModel(this.weatherRepo);

  CountryWeather? _country;

  CountryWeather? get country => _country;
  bool _hasData = false;

  bool get hasData => _hasData;

  getWeatherByCountryName(BuildContext context, String countryName) async {

    weatherRepo.getWeather(countryName).then((value) {
      _country = value;
      _hasData = true;

      //  print(country.humidity);
      notifyListeners();
    }).catchError((e) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.amberAccent,
              title: Text("Please Input a Correct Name"),
            );
          });
      print("${e.toString()} ;;;;");
    });
  }

  refresh(BuildContext context, String countryName) {
    getWeatherByCountryName(context,countryName);
  }
}
