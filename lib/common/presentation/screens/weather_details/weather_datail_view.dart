import 'package:flutter/material.dart';
import 'package:roaa_weather/common/data/models/weather/country_weather.dart';

class WeatherDetailsView extends StatelessWidget {
CountryWeather country;
int c;
WeatherDetailsView(this.country,this.c);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text(
          country.name,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),

      body: Container(
        margin:const EdgeInsets.symmetric(vertical: 18),
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.asset(
              c<=22?   "assets/storm.png":"assets/sun.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
             const   SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children: [
                      customCard(context,"Wind", "${country.wind.toString()} meter/sec"),
                      customCard(context,"Pressure", country.pressure.toString()),
                      customCard(context,"FeelsLike", country.feelsLike.toString()),
                      customCard(context,"Humidity", "${country.humidity.toString()} %"),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  customCard(BuildContext context, String type, String value) {
    return Card(
      color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
