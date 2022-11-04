import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/login_model/login_model.dart';
import '../../database/local/cache_helper.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

//change password icon logic
  IconData suffixIcon = Icons.visibility;
  bool isPasswordShown = true;

  void changePasswordIcon() {
    isPasswordShown = !isPasswordShown;
    suffixIcon = isPasswordShown ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordIconState());
  }

  //login logic
  LoginModel? loginModel;

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    await DioHelper.postData(url: loginEndPoint, data: {
      'email': email,
      'password': password,
    }).then((value) {
      if (value.statusCode == 200) {
        loginModel = LoginModel.fromJson(value.data);
        CacheHelper.saveData(key: 'token', value: loginModel!.accessToken)
            .then((value) {
          loginModel!.accessToken;
        });
        emit(LoginSuccess());
      }
    }).catchError((e) {
      print(e.toString());
      emit(LoginError());
    });
  }
}
