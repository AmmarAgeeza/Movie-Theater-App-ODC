import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_odc/core/resources/color_manager.dart';

import '../../../view_model/cubit/home_layout_cubit/home_layout_cubit.dart';
import '../../../view_model/cubit/home_layout_cubit/home_layout_states.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.backgroundColor,
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor:ColorManager.backgroundColor,
              selectedItemColor:ColorManager.primary,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeCurrentPage(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.stadium), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
