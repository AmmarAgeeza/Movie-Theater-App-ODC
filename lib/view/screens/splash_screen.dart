import 'package:flutter/material.dart';
import 'package:movie_app_odc/core/resources/color_manager.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/routes.dart';
import '../../view_model/database/local/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      String? token = await CacheHelper.getData(key: 'token');
      if (token != null) {
        Navigator.pushReplacementNamed(context, Routes.homeLayoutRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Center(
        child: Image.asset(ImageAssets.starsTheater),
      ),
    );
  }
}
