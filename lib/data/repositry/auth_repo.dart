import 'package:roaa_weather/data/web_services/auth_web_service.dart';

class AuthRepo{
  final AuthWebService _authWebService;

  AuthRepo(this._authWebService);

  login({required String email, required String password}){
    return _authWebService.login(email: email,password: password);
  }

  register({required String email, required String password}){
    return _authWebService.register(email: email,password: password);
  }
}