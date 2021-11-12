import 'package:weather_app/common/data/domain/weather/remote_weather_data_src.dart';
import 'package:weather_app/common/data/models/weather/country_weather.dart';
import 'package:weather_app/common/data/shared/data_source.dart';
import 'local_weather_data_src.dart';

class WeatherRepo {
  final RemoteWeatherDataSrc remoteWeatherDataSrc;
  final LocalWeatherDataSrc localWeatherDataSrc;

  WeatherRepo(this.localWeatherDataSrc, this.remoteWeatherDataSrc);

  //TODO: add loadType
  Future<CountryWeather> getWeather(DataSource dataSrc, String country) {
    switch (dataSrc) {
      case DataSource.local:
        return remoteWeatherDataSrc.getWeather(country); //TODO: add getWeather
      case DataSource.remote:
        return remoteWeatherDataSrc.getWeather(country);
    }
  }
}
