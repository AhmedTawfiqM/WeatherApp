import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roaa_weather/common/data/domain/auth/auth_data_source.dart';
import 'package:roaa_weather/common/data/domain/auth/auth_repo.dart';
import 'package:roaa_weather/common/data/domain/auth/auth_web_service.dart';
import 'package:roaa_weather/common/data/domain/weather/wearher_web_service.dart';
import 'package:roaa_weather/common/data/domain/weather/weather_repo.dart';
import 'package:roaa_weather/common/presentation/screens/weather/weather_view_model.dart';
import 'package:roaa_weather/common/presentation/shared/cubit/authentication_cubit.dart';

class AppInjector {
  var authWebService = AuthWebService();
  var authDataSource = AuthDataSource();
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
