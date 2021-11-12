import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roaa_weather/common/data/models/weather/country_weather.dart';

class WeatherText extends StatelessWidget {
  WeatherText({required this.weatherItem, required this.hasData});

  final CountryWeather? weatherItem;
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
        if (weatherItem != null)
          Text(
            hasData ? "${(weatherItem!.temp - 273.15).toInt()} C" : "",
            style: Theme.of(context).textTheme.bodyText2,
          )
      ],
    );
  }
}
