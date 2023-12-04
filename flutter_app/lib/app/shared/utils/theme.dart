import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF242A68);
  static const whiteColor = Color(0xFFFFFFFF);
  static const redLight = Color(0xFFFF7272);
  static const greenLight = Color(0xFF13B58C);
  static const blackColor = Color(0xFF000000);
  static const blackMediumColor = Color(0xFF212121);
  static const blackGrey = Color(0xFF4F4F4F);
  static const backgroundColor = Color(0xFFF6F9FF);
  static const placeholderImageColor = Color(0xFFEEEEEE);
}

class AppSize {
  static const f1 = 24.0; // title
  static const f2 = 22.0; // tutorial page
  static const f3 = 20.0;
  static const f4 = 18.0; // subtitle big
  static const f5 = 16.0; // subtitle, text button,
  static const f6 = 14.0;
  static const f7 = 12.0; // name category
  static const f8 = 10.0;
}

double widthP(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heightP(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double sizeText(BuildContext context, double size) {
  return MediaQuery.of(context).size.width / 100 * (size / 3);
}

double sizePersen(BuildContext context, double size) {
  return (MediaQuery.of(context).size.width / 100) * size;
}

double widgetHeight(context, Widget widget) {
  double size = 0.0;

  return size;
}
