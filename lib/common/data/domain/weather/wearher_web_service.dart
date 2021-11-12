import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/common/data/apis/weather_api.dart';
import 'package:weather_app/common/data/network/dio_network.dart';

class WeatherWebService {
  Future getWeather(String country) async {
    var url = apiUrl(country);
    http.Response _response = await appDio.get(url);

    var _body = jsonDecode(_response.body);
    return _body;
  }
}
