import 'package:firebase_core/firebase_core.dart';
import 'package:roaa_weather/common/data/shared_pref/shar_pref.dart';

class App {
  setup() async {
    await Firebase.initializeApp();
    await AppSharedPref.init();
  }
}
