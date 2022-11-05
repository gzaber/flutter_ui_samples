import 'package:flutter/material.dart';

import 'package:coffee_shop_app_ui/config/config.dart';

class CustomAppBarButton extends StatelessWidget {
  const CustomAppBarButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isTransparent = false,
  }) : super(key: key);

  final IconData icon;
  final Function onTap;
  final bool isTransparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: isTransparent ? Colors.transparent : null,
        borderRadius: const BorderRadius.all(Radius.circular(22)),
        gradient: !isTransparent
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF262B33),
                  const Color(0xFF262B33).withOpacity(0),
                ],
              )
            : null,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF20242C),
              Color(0xFF0C0F14),
            ],
          ),
        ),
        child: Icon(
          icon,
          size: 30,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
