import 'package:roaa_weather/common/data/shared_pref/shar_pref.dart';
import 'data_keys.dart';

class SharedPrefHelper {

  setUserId(String id) {
    AppSharedPref.putData(key: PrefKey.userId, value: id);
  }
}
