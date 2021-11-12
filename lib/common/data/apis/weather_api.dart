import 'package:weather_app/common/core/app_config.dart';

Uri weatherApi(String country) {
  var url = '${AppConfig.baseUrl}weather?q=$country&appid=${AppConfig.apiKey}';
  return Uri.parse(url);
}

String apiUrl(String country) {
  return "weather?q=$country&appid=${AppConfig.apiKey}";
}
