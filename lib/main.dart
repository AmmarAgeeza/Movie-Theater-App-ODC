import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_odc/view_model/cubit/bloc_observer.dart';
import 'package:movie_app_odc/view_model/cubit/login_cubit/login_cubit.dart';
import 'package:movie_app_odc/view_model/database/network/dio_helper.dart';

import 'core/resources/color_manager.dart';
import 'core/routes.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: ColorManager.primary,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RoutesGenerator.getRoute,
        title: 'Movie App ODC',
      ),
    );
  }
}
