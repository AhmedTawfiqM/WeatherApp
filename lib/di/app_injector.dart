import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roaa_weather/data/repositry/auth_repo.dart';
import 'package:roaa_weather/data/repositry/weather_repo.dart';
import 'package:roaa_weather/data/web_services/auth_web_service.dart';
import 'package:roaa_weather/data/web_services/wearher_web_service.dart';
import 'package:roaa_weather/presentation/screens/weather/weather_view_model.dart';
import 'package:roaa_weather/presentation/shared/cubit/authentication_cubit.dart';

class AppInjector {
  var authWebService = AuthWebService();
  late AuthRepo authRepo = AuthRepo(authWebService);
  late AuthCubit cubitLogin = AuthCubit(authRepo);

  var weatherWebService = WeatherWebService();
  late WeatherRepo weatherRepo = WeatherRepo(weatherWebService);
  late WeatherViewModel weatherViewModel = WeatherViewModel(weatherRepo);

  injectBloc() {
    return [BlocProvider(create: (context) => cubitLogin)];
  }

  injectProvider() {
    return [Provider<WeatherViewModel>(create: (_) => weatherViewModel)];
  }
}
