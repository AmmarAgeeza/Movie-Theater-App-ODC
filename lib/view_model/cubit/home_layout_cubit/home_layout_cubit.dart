import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_odc/view/screens/home_screen/home_screen.dart';
import 'package:movie_app_odc/view/screens/my_tickets_screen/my_tickets_screen.dart';
import 'package:movie_app_odc/view/screens/search_screen/search_screen.dart';

import 'home_layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(InitialAppState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  //bottom nav bar logic
  List screens = <Widget>[
    const HomePageScreen(),
    const MyTicketsScreen(),
    const SearchScreen(),
  ];
  int currentIndex = 0;

  void changeCurrentPage(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }
}
