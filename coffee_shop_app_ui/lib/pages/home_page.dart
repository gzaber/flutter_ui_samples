import 'package:coffee_shop_app_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            width: size.width,
            leading: CustomAppBarButton(
              icon: Icons.apps,
              onTap: () {},
            ),
            trailing: CustomImageButton(
              imageUrl:
                  'https://cdn.pixabay.com/photo/2021/06/15/16/11/man-6339003_960_720.jpg',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
