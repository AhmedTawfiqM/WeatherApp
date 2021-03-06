import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/screens/weather/weather_view_model.dart';
import 'package:weather_app/common/data/domain/auth/auth_repo.dart';
import 'package:weather_app/common/data/domain/auth/auth_web_service.dart';
import 'package:weather_app/common/data/domain/weather/local_weather_data_src.dart';
import 'package:weather_app/common/data/domain/weather/remote_weather_data_src.dart';
import 'package:weather_app/common/data/domain/weather/wearher_web_service.dart';
import 'package:weather_app/common/data/domain/weather/weather_repo.dart';
import 'package:weather_app/common/presentation/shared/cubit/authentication_cubit.dart';

class AppInjector {
  var authWebService = AuthWebService();
  late AuthRepo authRepo = AuthRepo(authWebService);
  late AuthCubit cubitLogin = AuthCubit(authRepo);

  //Weathers
  var weatherWebService = WeatherWebService();
  var localWeatherDataSrc = LocalWeatherDataSrc();
  late RemoteWeatherDataSrc remoteWeatherDataSrc =
  RemoteWeatherDataSrc(weatherWebService);
  late WeatherRepo weatherRepo =
      WeatherRepo(localWeatherDataSrc, remoteWeatherDataSrc);
  late WeatherViewModel weatherViewModel = WeatherViewModel(weatherRepo);

  injectBlocs() {
    return [BlocProvider(create: (context) => cubitLogin)];
  }

  injectProviders() {
    return [Provider<WeatherViewModel>(create: (_) => weatherViewModel)];
  }
}
