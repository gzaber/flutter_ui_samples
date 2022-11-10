import 'package:flutter/material.dart';

import '../config/config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.width,
    required this.leading,
    required this.trailing,
    this.isTransparent = false,
  }) : super(key: key);

  final double width;
  final Widget leading;
  final Widget trailing;
  final bool isTransparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 90,
      color: isTransparent ? Colors.transparent : AppColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [leading, trailing],
        ),
      ),
    );
  }
}
