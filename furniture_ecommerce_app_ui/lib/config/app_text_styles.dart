import 'package:flutter/material.dart';

import 'package:furniture_ecommerce_app_ui/config/config.dart';

class AppTextStyles {
  static const introSkipButton = TextStyle(
    color: AppColors.lightBlue,
    fontSize: 17,
  );
  static const introNextButton = TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
  static const introMediumTitle = TextStyle(
    color: Colors.white,
    fontSize: 22,
    letterSpacing: 0.8,
  );
  static const introLargeTitle = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.8,
  );
  static const introBody = TextStyle(
    color: Colors.white,
    fontSize: 13,
    height: 1.4,
    letterSpacing: 0.8,
  );

  static const homeTitleLarge = TextStyle(
    color: AppColors.green,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.3,
    fontSize: 22,
  );
  static const homeTitleMedium = TextStyle(
    color: AppColors.green,
    fontSize: 17,
  );
  static const homeProductName = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.6,
  );
  static const homeProductRating = TextStyle(
    color: Colors.grey,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const homeProductPrice = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const productCategoryName = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );
  static const productName = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.6,
  );
  static const productManufacturer = TextStyle(
    color: Colors.grey,
    fontSize: 13.5,
    fontWeight: FontWeight.w500,
  );
  static const productPrice = TextStyle(
    color: AppColors.productPriceBlue,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const productDescription = TextStyle(
    fontSize: 14,
    color: AppColors.productBlue,
    height: 1.4,
  );
  static const productMoreChair = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const productAmount = TextStyle(
    fontSize: 15,
    color: AppColors.green,
  );
  static const productAddToCart = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
}
