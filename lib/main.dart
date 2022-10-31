import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_odc/view/screens/home_layout_screen.dart';
import 'package:movie_app_odc/view/screens/splash_screen.dart';
import 'package:movie_app_odc/view_model/cubit/bloc_observer.dart';
import 'package:movie_app_odc/view_model/cubit/home_layout_cubit/home_layout_cubit.dart';
import 'package:movie_app_odc/view_model/cubit/home_page_cubit/home_page_cubit.dart';
import 'package:movie_app_odc/view_model/cubit/login_cubit/login_cubit.dart';
import 'package:movie_app_odc/view_model/cubit/search_cubit/search_cubit.dart';
import 'package:movie_app_odc/view_model/database/network/dio_helper.dart';

import 'core/resources/color_manager.dart';
import 'core/routes.dart';
import 'view_model/database/local/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => HomeLayoutCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => HomePageCubit()..getNowPlayingMovies()..getUpComingMovies()),
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
