import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roaa_weather/app/app.dart';
import 'package:roaa_weather/common/core/app_route.dart';
import 'package:roaa_weather/common/core/constant.dart';
import 'package:roaa_weather/common/data/shared_pref/shar_pref.dart';
import 'di/app_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  App().setup();

  var widget = AppRoute().widget();
  runApp(WeatherApp(widget));
}

class WeatherApp extends StatelessWidget {
  final Widget widget;
  final appInjector = AppInjector();

  WeatherApp(this.widget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: appInjector.injectBlocs(),
      child: MultiProvider(
        providers: appInjector.injectProviders(),
        child: MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: widget,
        ),
      ),
    );
  }
}
