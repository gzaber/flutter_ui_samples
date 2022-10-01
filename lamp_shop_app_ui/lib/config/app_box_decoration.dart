import 'package:flutter/material.dart';
import 'package:lamp_shop_app_ui/config/config.dart';

class AppBoxDecoration {
  static final customNavBar = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.white,
        Colors.white.withOpacity(0),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: const [0.85, 1],
    ),
  );

  static const customNavBarItem = BoxDecoration(
    shape: BoxShape.circle,
    color: AppColors.darkNavy,
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 12,
        spreadRadius: 2,
        offset: Offset(0.0, 8.0),
      ),
    ],
  );

  static const colorBar = BoxDecoration(
    color: Color(0xFFF7F7F7),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40),
      bottomLeft: Radius.circular(40),
    ),
  );

  static const colorBoxChecked = BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
  );

  static final whiteFrame = BoxDecoration(
    color: Colors.white.withOpacity(0.4),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(50),
    ),
  );

  static const details = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(45),
    ),
  );
}
