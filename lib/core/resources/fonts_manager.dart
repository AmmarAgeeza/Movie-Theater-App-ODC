import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontWeightManager {
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;
}

class FontSize {
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s35 = 35.0;
  static const double s38 = 38.0;
}

class AppTextStyles {
  static login({double customFontSize=FontSize.s35,Color customColor= Colors.white}) => GoogleFonts.salsa(
      textStyle:  TextStyle(
          color: customColor,
          fontSize: customFontSize,
          fontWeight: FontWeightManager.regular));
}
