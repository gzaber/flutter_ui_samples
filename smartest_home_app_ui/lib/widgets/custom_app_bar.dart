import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.height,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon,
    this.leadingOnPressed,
    this.trailingOnPressed,
  }) : super(key: key);

  final double height;
  final String title;
  final IconData leadingIcon;
  final IconData? trailingIcon;
  final Function()? leadingOnPressed;
  final Function()? trailingOnPressed;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Column(
        children: [
          const Spacer(),
          AppBar(
            titleTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 30,
            ),
            leadingWidth: 66,
            toolbarHeight: height,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: leadingOnPressed ?? () {},
                icon: Icon(leadingIcon),
              ),
            ),
            title: Text(title),
            actions: [
              trailingIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: trailingOnPressed ?? () {},
                        icon: Icon(trailingIcon),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
