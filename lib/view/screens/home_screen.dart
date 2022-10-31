import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_odc/core/resources/color_manager.dart';
import 'package:movie_app_odc/model/now_playing_movies_model.dart';
import 'package:movie_app_odc/model/up_coming_movies_model.dart';
import 'package:movie_app_odc/view_model/cubit/home_page_cubit/home_page_cubit.dart';
import 'package:movie_app_odc/view_model/cubit/home_page_cubit/home_page_states.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/fonts_manager.dart';

class HomePageScreen extends StatelessWidget {
   const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: HomePageCubit.get(context).globalKey,
          backgroundColor: ColorManager.backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: AppBar(
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    HomePageCubit.get(context).globalKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: ColorManager.primary,
                  )),
              centerTitle: true,
              backgroundColor: ColorManager.backgroundColor,
              title: Image.asset(
                ImageAssets.starsTheater,
                height: 60,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Now Playing',
                  style: AppTextStyles.login(),
                ),
                Text(
                  'Book your ticket now',
                  style: AppTextStyles.login(
                    customColor: ColorManager.primary,
                    customFontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  items: HomePageCubit.get(context)
                      .nowPlayingMoviesList!
                      .map((e) => buildNowPlayingMovieItem(e))
                      .toList(),
                  options: CarouselOptions(
                    // aspectRatio:1.5,
                    height: 250.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    // autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Coming Soon',
                      style: AppTextStyles.login(customFontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildUpComingMovieItem(
                        HomePageCubit.get(context).upComingMoviesList![index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                    itemCount:
                        HomePageCubit.get(context).upComingMoviesList!.length,
                  ),
                ),
              ],
            ),
          ),
          drawer: SafeArea(
            child: Column(
              children: [
                Text('ss'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildNowPlayingMovieItem(NowPlayingMoviesModel nowPlayingMoviesModel) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.network(nowPlayingMoviesModel!.imageUrl!),
        Text(
          nowPlayingMoviesModel!.name!,
          style: AppTextStyles.login(customFontSize: 15),
        ),
      ],
    );
  }

  Stack buildUpComingMovieItem(UpComingMoviesModel upComingMoviesModel) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.network(upComingMoviesModel!.imageUrl!),
        Text(
          upComingMoviesModel!.name!,
          style: AppTextStyles.login(customFontSize: 15),
        ),
      ],
    );
  }
}
