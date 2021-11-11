import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roaa_weather/common/presentation/screens/weather/weather_view_model.dart';
import '../weather_details/weather_datail_view.dart';

class WeatherScreen extends StatelessWidget {
  TextEditingController countryController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var weatherViewModel = Provider.of<WeatherViewModel>(context);

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
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width - 30,
                  child: TextFormField(
                      controller: countryController,
                      validator: (v) {
                        if (v.toString().isEmpty) {
                          return "Search can not be empty";
                        } else {}
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(20)),
                        focusColor: Colors.black,
                        labelText: "Search For Your Country Weather",
                        labelStyle: const TextStyle(fontSize: 20),
                        suffix: IconButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              weatherViewModel.getWeatherByCountryName(
                                  context, countryController.text);

                              countryController.clear();
                              //   provider.getAllCountries();
                            }
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                      onFieldSubmitted: (v) {
                        if (formKey.currentState!.validate()) {
                          weatherViewModel.getWeatherByCountryName(
                              context, countryController.text);
                          countryController.clear();
                        }
                      },
                      keyboardType: TextInputType.emailAddress),
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/weather.png",
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    ),
                    if (weatherViewModel.country != null)
                      Text(
                        weatherViewModel.hasData
                            ? "${(weatherViewModel.country!.temp - 273.15).toInt()} C"
                            : "",
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                  ],
                ),
                weatherViewModel.hasData
                    ? _weatherDetailsWidget(context, weatherViewModel)
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _weatherDetailsWidget(BuildContext context, var provider) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WeatherDetailsView(
                  provider.country, (provider.country.temp - 273.15).toInt())));
        },
        child: Text(
          "Click  Here For Weather Details",
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }
}
