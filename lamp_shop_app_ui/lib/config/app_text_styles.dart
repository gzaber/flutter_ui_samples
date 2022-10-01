import 'package:flutter/material.dart';
import 'package:lamp_shop_app_ui/config/config.dart';

class AppTextStyles {
  static const TextStyle homeHeaderTitle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle homeHeaderHeadline = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 27,
  );

  static const TextStyle homeHeaderBody = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );

  static const TextStyle homeHeaderButton = TextStyle(
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static const TextStyle homeGridViewTitle = TextStyle(
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
    fontSize: 23,
  );

  static const TextStyle homeGridViewItemName = TextStyle(
    color: AppColors.lightBlack,
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );

  static const TextStyle homeGridViewItemPrice = TextStyle(
    color: AppColors.lightBlack,
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );

  static const TextStyle detailsAppBarTitle = TextStyle(
    color: AppColors.lightBlack,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle detailsBuyButton = TextStyle(
    color: Colors.white,
    fontSize: 19,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle detailsHeaderName = TextStyle(
    color: AppColors.lightBlack,
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: 1,
    height: 1.0,
  );

  static TextStyle detailsPriceLabel = TextStyle(
    color: Colors.grey.shade400,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static const TextStyle detailsPriceValue = TextStyle(
    color: AppColors.lightBlack,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle detailsColorLabel = TextStyle(
    color: Colors.grey.shade600,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle detailsDescription = TextStyle(
    color: AppColors.lightBlack,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
}
