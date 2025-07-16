import 'package:ai_project/helper/colors.dart';
import 'package:flutter/widgets.dart';

class TextStyleHelper {
  static TextStyle? textStyle({
    Color? color,
    double fontSize=14,
    FontWeight fontWeight = FontWeight.normal,
  }){
    return TextStyle(
      color: color?? black,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}