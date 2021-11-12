
import 'package:weather_app/common/data/domain/weather/wearher_web_service.dart';
import 'package:weather_app/common/data/models/weather/country_weather.dart';

class RemoteWeatherDataSrc {
  final WeatherWebService _weatherWebService;

  RemoteWeatherDataSrc(this._weatherWebService);

  CountryWeather _country = initialCountryWeather;

  CountryWeather get country => _country;

  Future<CountryWeather> getWeather(String country) async =>
      await _weatherWebService.getWeather(country).then((value) {
        _country = CountryWeather.fromjson(value);
        return _country;
      }).catchError((e) {
        print(e.toString());
      });

}
