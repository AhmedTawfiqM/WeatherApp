import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roaa_weather/app/screens/weather/weather_view_model.dart';
import 'package:roaa_weather/common/data/domain/auth/auth_repo.dart';
import 'package:roaa_weather/common/data/domain/auth/auth_web_service.dart';
import 'package:roaa_weather/common/data/domain/weather/local_weather_data_src.dart';
import 'package:roaa_weather/common/data/domain/weather/remote_weather_data_src.dart';
import 'package:roaa_weather/common/data/domain/weather/wearher_web_service.dart';
import 'package:roaa_weather/common/data/domain/weather/weather_repo.dart';
import 'package:roaa_weather/common/presentation/shared/cubit/authentication_cubit.dart';

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

  injectBloc() {
    return [BlocProvider(create: (context) => cubitLogin)];
  }

  injectProvider() {
    return [Provider<WeatherViewModel>(create: (_) => weatherViewModel)];
  }
}
