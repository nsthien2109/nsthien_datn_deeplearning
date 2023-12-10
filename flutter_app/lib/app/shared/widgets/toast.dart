import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/shared/utils/theme.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToast(
    context, toastText) {
  final snackBar = SnackBar(
      elevation: 3,
      backgroundColor: AppColors.primaryColor,
      behavior: SnackBarBehavior.floating,
      content: Text(toastText));
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
