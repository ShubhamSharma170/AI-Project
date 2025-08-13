import 'package:ai_project/helper/colors.dart';
import 'package:flutter/material.dart';

Widget customCircularProgress(Color? color) {
  return Center(child: CircularProgressIndicator(color: color ?? black,));
}
