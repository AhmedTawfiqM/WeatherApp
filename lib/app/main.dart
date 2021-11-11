import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roaa_weather/common/core/app_route.dart';
import 'package:roaa_weather/common/core/constant.dart';
import 'package:roaa_weather/common/data/shar_pref.dart';
import 'di/app_injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();
  Widget widget;

  AppRoute appRoute = AppRoute();
  widget = appRoute.isLogin(); //TODO: refactor
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  Widget widget;
  var appInjector = AppInjector();

  MyApp(this.widget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: appInjector.injectBloc(),
      child: MultiProvider(
        providers: appInjector.injectProvider(),
        child: MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: widget,
        ),
      ),
    );
  }
}
