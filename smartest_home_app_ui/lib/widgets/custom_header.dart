import 'package:flutter/material.dart';

import 'package:smartest_home_app_ui/config/config.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.title,
    this.paddingTop = 20,
    this.paddingBottom = 10,
    this.buttonKey,
  }) : super(key: key); // coverage:ignore-line

  final String title;
  final double paddingTop;
  final double paddingBottom;
  final Key? buttonKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 25, right: 15, top: paddingTop, bottom: paddingBottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.darkBrown,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              key: buttonKey,
              onTap: () {},
              customBorder: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: AppColors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
