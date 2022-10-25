import 'package:flutter/material.dart';
import 'package:movie_app_odc/core/resources/color_manager.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushNamed(context, Routes.loginRoute));
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
