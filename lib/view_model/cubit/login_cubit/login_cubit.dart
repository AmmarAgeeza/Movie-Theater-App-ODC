import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_odc/view/screens/home_layout_screen.dart';

import '../../../model/login_model.dart';
import '../../../view/components/core_components/shared_functions.dart';
import '../../database/local/cache_helper.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  IconData suffixIcon = Icons.visibility;
  bool isPasswordShown = true;

  void changePasswordIcon() {
    isPasswordShown = !isPasswordShown;
    suffixIcon = isPasswordShown ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordIconState());
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel? loginModel;
  String? token;

  void login(context) {
    emit(LoginLoading());
    DioHelper.postData(url: loginEndPoint, data: {
      'email': emailController.text,
      'password': passwordController.text,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel!.accessToken);
      token = loginModel!.accessToken;
      CacheHelper.saveData(key: 'token', value: loginModel!.accessToken)
          .then((value) {
        loginModel!.accessToken;
        navigateAndFinish(context, const HomeLayoutScreen());
      });
      emit(LoginSuccess());
    }).catchError((e) {
      print(e.toString());
      emit(LoginError());
    });
  }

  void validateData(context) {
    if (formKey.currentState!.validate()) {
      login(context);
    }
  }
}
