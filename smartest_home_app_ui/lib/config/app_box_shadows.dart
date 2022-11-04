import 'package:flutter/material.dart';
import 'package:smartest_home_app_ui/config/config.dart';

class AppBoxShadows {
  static const homeSceneItem = BoxShadow(
    color: AppColors.brownButton,
    spreadRadius: -8,
    blurRadius: 10,
    offset: Offset(0, 15),
  );
  static const lightCustomSliderThumb = BoxShadow(
    color: Color.fromARGB(255, 117, 117, 117),
    spreadRadius: 1,
    blurRadius: 5,
  );
  static const roomEnergyUsageChartThumb = BoxShadow(
    color: Color.fromARGB(255, 117, 117, 117),
    spreadRadius: 2,
    blurRadius: 10,
  );
  static const roomTurnOffButton = BoxShadow(
    color: AppColors.brownButton,
    spreadRadius: -8,
    blurRadius: 10,
    offset: Offset(0, 10),
  );
}
