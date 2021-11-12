import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/screens/weather/views/search_weather_widget.dart';
import 'package:weather_app/app/screens/weather/views/weather_widget.dart';
import 'package:weather_app/app/screens/weather/weather_view_model.dart';
import 'package:weather_app/common/data/shared/data_source.dart';
import '../weather_details/weather_datail_view.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController countryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late WeatherViewModel weatherVM;

  @override
  Widget build(BuildContext context) {
    weatherVM = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchTextField(
                    controller: countryController,
                    onPressed: () {
                      getWeather(context);
                    },
                    onFieldSubmitted: () {
                      getWeather(context);
                    }),
                WeatherText(
                  weather_app: weatherVM.country,
                  hasData: weatherVM.hasData,
                ),
                weatherVM.hasData
                    ? _weatherDetailsWidget(context, weatherVM)
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getWeather(BuildContext context) {
    if (formKey.currentState!.validate()) {
      weatherVM.getWeatherByCountryName(
          context, DataSource.remote, countryController.text);

      countryController.clear();
      //   provider.getAllCountries();
    }
  }

  _weatherDetailsWidget(BuildContext context, var weatherVM) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WeatherDetailsView(weatherVM.country,
                  (weatherVM.country.temp - 273.15).toInt())));
        },
        child: Text(
          "Click  Here For Weather Details",
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }
}
