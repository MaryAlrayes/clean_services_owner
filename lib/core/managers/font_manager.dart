import 'package:flutter/cupertino.dart';
import 'package:saudi_clean_services_owner/core/managers/languages_manager.dart';

class FontConstants {
  static const cairoFontFamily = 'Cairo';
  // static const montserratFontFamily = 'Montserrat';
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
}

// String getFontFamily(String locale) {
//   switch (locale) {
//     case LanguagesManager.Arabic:
//       return FontConstants.cairoFontFamily;
//     case LanguagesManager.English:
//       return FontConstants.montserratFontFamily;
//     default:
//       return FontConstants.cairoFontFamily;
//   }
//}
