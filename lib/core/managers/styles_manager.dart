
import 'package:flutter/cupertino.dart';
import 'package:saudi_clean_services_owner/core/managers/font_manager.dart';


TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
}

TextStyle getRegularStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

TextStyle getMediumStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

TextStyle getLightStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

TextStyle getBoldStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}
