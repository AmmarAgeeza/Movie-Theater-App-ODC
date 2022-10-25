import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';

Widget defaultButton({
  double width = double.infinity,
  Color? backgroundColor ,
  Color? textColor ,
  double radius = 15.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style:  TextStyle(
            color: textColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
