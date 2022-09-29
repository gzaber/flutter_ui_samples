import 'package:flutter/material.dart';
import 'package:lamp_shop_app_ui/config/config.dart';

class AppTextStyles {
  static const TextStyle headerTitle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 23,
  );

  static const TextStyle headerHeadline = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 32,
  );

  static const TextStyle headerBody = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle headerButton = TextStyle(
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
    fontSize: 19,
  );

  static const TextStyle gridViewTitle = TextStyle(
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
    fontSize: 27,
  );

  static const TextStyle gridViewItemName = TextStyle(
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle gridViewItemPrice = TextStyle(
    color: AppColors.lightBlack,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
}
