import 'package:flutter/material.dart';

import 'package:smartest_home_app_ui/config/config.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.title,
    this.paddingTop = 30,
    this.paddingBottom = 20,
  }) : super(key: key);

  final String title;
  final double paddingTop;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 25, right: 25, top: paddingTop, bottom: paddingBottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.darkBrown,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.add,
            size: 25,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
