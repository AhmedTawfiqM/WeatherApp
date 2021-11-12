import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/common/data/models/weather/country_weather.dart';

class WeatherText extends StatelessWidget {
  WeatherText({required this.weather_app, required this.hasData});

  final CountryWeather? weather_app;
  final bool hasData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/weather.png",
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),

        if (weather_app != null)
          Text(
            hasData ? "${(weather_app!.temp - 273.15).toInt()} C" : "",
            style: Theme.of(context).textTheme.bodyText2,
          )
      ],
    );
  }
}
