import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/core/state/resource_state.dart';
import 'package:weather_app/common/data/domain/auth/auth_repo.dart';

class AuthCubit extends Cubit<ResourceState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(ResourceInitState());

  static AuthCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) {

    emit(ResourceLoadingState());
    authRepo.register(password: password, email: email).then((value) {
      print("user register");
      emit(ResourceSucceedState(value.user!.uid));
    }).catchError((e) {
      print("user error  ");
      emit(ResourceErrorState(e.toString()));
    });
  }

  void logIn({required String email, required String password}) {
    emit(ResourceLoadingState());
    authRepo.login(email: email, password: password).then((value) {
      print("user login");
      emit(ResourceSucceedState(value.user!.uid));
    }).catchError((e) {
      print("user error ");
      emit(ResourceErrorState(e.toString()));
    });
  }

  bool _isVisible = true;

  bool get isVisible => _isVisible;

  void changeVisibility() {
    _isVisible = !_isVisible;
    emit(ResourceVisibilityState());
  }
}
