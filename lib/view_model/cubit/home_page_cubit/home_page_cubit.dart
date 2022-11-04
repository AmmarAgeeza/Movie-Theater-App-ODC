import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_odc/model/now_playing_movies_model/now_playing_movies_model.dart';

import '../../../model/up_coming_movies_model/up_coming_movies_model.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../login_cubit/login_cubit.dart';
import 'home_page_states.dart';

class HomePageCubit extends Cubit<HomeScreenStates> {
  HomePageCubit() : super(InitialAppState());

  static HomePageCubit get(context) => BlocProvider.of(context);
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  List? nowPlayingMoviesList;

  void getNowPlayingMovies() {
    nowPlayingMoviesList = [];
    emit(GetNowPlayingMoviesLoadingState());
    DioHelper.getData(
      url: nowPlayingMoviesEndPoint,
      token: token,
    ).then((value) {
      print(value.data);
      // for(var item in value.data)
      //   {
      //     nowPlayingMoviesList!.add(NowPlayingMoviesModel.fromJson(item));
      //   }
      nowPlayingMoviesList =
          value.data.map((e) => NowPlayingMoviesModel.fromJson(e)).toList();
      print(nowPlayingMoviesList![0].id);
      // LoginCubit.get(context).token;
      emit(GetNowPlayingMoviesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNowPlayingMoviesErrorState());
    });
  }
  List? upComingMoviesList;

  void getUpComingMovies() {

    upComingMoviesList = [];
    emit(GetUpComingMoviesLoadingState());
    DioHelper.getData(
      url: upComingMoviesPoint,
      token: token,
    ).then((value) {
      // print(1);
      // print(value.data);
      // for(var item in value.data)
      //   {
      //     nowPlayingMoviesList!.add(NowPlayingMoviesModel.fromJson(item));
      //   }
      upComingMoviesList =
          value.data.map((e) => UpComingMoviesModel.fromJson(e)).toList();
      // print(upComingMoviesList![0].name);

      emit(GetUpComingMoviesSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUpComingMoviesErrorState());
    });
  }
}
