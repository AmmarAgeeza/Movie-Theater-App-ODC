import 'package:flutter/material.dart';
import 'package:movie_app_odc/core/resources/color_manager.dart';

TextButton buildTextButton({required String text,bool isUnderline =true}) {
  return TextButton(
      onPressed: () {},
      child:  Text(
        text,
        style: TextStyle(
            color: ColorManager.primary,
            fontSize: 20,
            decoration: isUnderline?TextDecoration.underline:TextDecoration.none,
            // decorationColor:
            decorationThickness: 1.5),
      ));
}