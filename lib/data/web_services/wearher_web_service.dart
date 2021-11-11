import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:roaa_weather/data/apis/weather_api.dart';

class WeatherWebService {
  Future getWeather(String country) async {
    var url = weatherApi(country);
    http.Response _response = await http.get(url);
    //print(response.body);

    var _body = jsonDecode(_response.body);
    return _body;
  }
}
