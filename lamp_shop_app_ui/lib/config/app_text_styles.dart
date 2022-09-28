import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles({required double ratio}) : _ratio = ratio;

  final double _ratio;

  TextStyle get headerTitle => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 23 * _ratio,
      );

  TextStyle get headerHeadline => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 32 * _ratio,
      );

  TextStyle get headerBody => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16 * _ratio,
      );

  TextStyle get headerButton => TextStyle(
        color: AppColors.lightBlack,
        fontWeight: FontWeight.bold,
        fontSize: 19 * _ratio,
      );

  TextStyle get gridViewTitle => TextStyle(
        color: AppColors.lightBlack,
        fontWeight: FontWeight.bold,
        fontSize: 27 * _ratio,
      );

  TextStyle get gridViewItemName => TextStyle(
        color: AppColors.lightBlack,
        fontWeight: FontWeight.bold,
        fontSize: 20 * _ratio,
      );

  TextStyle get gridViewItemPrice => TextStyle(
        color: AppColors.lightBlack,
        fontWeight: FontWeight.w500,
        fontSize: 20 * _ratio,
      );
}
