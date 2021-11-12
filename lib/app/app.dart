import 'package:firebase_core/firebase_core.dart';

import 'package:weather_app/common/data/shared_pref/shar_pref.dart';

/*
  Created by Ahmed Tawfik on 11/11/21.
 */
class App {
  setup() async {
    await Firebase.initializeApp();
    await AppSharedPref.init();
  }
}
