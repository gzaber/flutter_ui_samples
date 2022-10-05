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
}
