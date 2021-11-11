class CountryWeather {
  late String _name;

  late double _temp;
  late int _humidity;

  late double _wind;
  late int _pressure;
  late double _feelsLike;

  String get name => _name;

  double get temp => _temp;

  int get humidity => _humidity;

  double get wind => _wind;

  int get pressure => _pressure;

  double get feelsLike => _feelsLike;

  CountryWeather(
      {required feelsLike,
      required name,
      required humidity,
      required pressure,
      required temp,
      required wind})
      : _feelsLike = feelsLike,
        _temp = temp,
        _name = name,
        _humidity = humidity,
        _pressure = pressure,
        _wind = wind;

  CountryWeather.fromjson(Map<String, dynamic> json) {
    _name = json["name"];
    _temp = json["main"]["temp"];
    _wind = json["wind"]["speed"];
    _humidity = json["main"]["humidity"];
    _pressure = json["main"]["pressure"];
    _feelsLike = json["main"]["feels_like"];
  }
}

CountryWeather initialCountryWeather = CountryWeather(
    feelsLike: 20.0,
    name: "london",
    humidity: 20,
    pressure: 20,
    temp: 20.0,
    wind: 20.0);

