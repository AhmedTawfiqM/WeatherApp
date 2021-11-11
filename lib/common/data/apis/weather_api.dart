import 'package:roaa_weather/common/core/app_config.dart';

Uri weatherApi(String country){
  var url =  '${AppConfig.baseUrl}weather?q=$country&appid=${AppConfig.apiKey}';
  return Uri.parse(url);
}

