import 'package:flutter/material.dart';
import 'package:lamp_shop_app_ui/config/config.dart';

import 'package:lamp_shop_app_ui/models/models.dart';
import 'package:lamp_shop_app_ui/pages/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lamps = Lamp.lamps;

    return Scaffold(
      bottomNavigationBar: const _CustomNavBar(),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            const _GridViewTitle(),
            _GridView(lamps: lamps),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.edgeInsets.header,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: AppDimensions.borderRadius.circular30,
                child: Image.network(
                  Lamp.headerLampUrl,
                  width: double.infinity,
                  height: AppDimensions.headerImageHeightRatio *
                      MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 25,
                left: 20,
                child: Row(
                  children: const [
                    Icon(
                      Icons.light,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text('Moli', style: AppTextStyles.headerTitle),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                left: 20,
                right: 15,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'The most\nUnique Lights',
                            style: AppTextStyles.headerHeadline,
                          ),
                          Text(
                            'For Daily Living.',
                            style: AppTextStyles.headerBody,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: AppDimensions.borderRadius.circular20,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: AppDimensions.edgeInsets.exploreButton,
                          ),
                          child: const Text(
                            'Explore',
                            style: AppTextStyles.headerButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GridViewTitle extends StatelessWidget {
  const _GridViewTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.edgeInsets.gridViewTitle,
      child: const Text(
        'New Arrivals',
        style: AppTextStyles.gridViewTitle,
      ),
    );
  }
}

class _GridView extends StatelessWidget {
  const _GridView({
    Key? key,
    required this.lamps,
  }) : super(key: key);

  final List<Lamp> lamps;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppDimensions.edgeInsets.gridView,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: AppDimensions.gridItemAspectRatio,
        crossAxisSpacing: 15,
      ),
      itemCount: lamps.length,
      itemBuilder: (_, index) {
        return _GridViewItem(lamp: lamps[index]);
      },
    );
  }
}

class _GridViewItem extends StatelessWidget {
  const _GridViewItem({
    Key? key,
    required this.lamp,
  }) : super(key: key);

  final Lamp lamp;

  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(lamp.imageUrl);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: AppDimensions.borderRadius.circular20,
              child: Material(
                child: Ink.image(
                  image: image,
                  width: double.infinity,
                  height: AppDimensions.inkImageHeightRatio *
                      MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, DetailsPage.route(lamp: lamp));
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Material(
                color: AppColors.darkNavy,
                shape: RoundedRectangleBorder(
                  borderRadius: AppDimensions.borderRadius.circular30,
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: AppDimensions.borderRadius.circular30,
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.add,
                      size: 23,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  lamp.name,
                  style: AppTextStyles.gridViewItemName,
                ),
                const SizedBox(height: 5),
                Text(
                  lamp.price,
                  style: AppTextStyles.gridViewItemPrice,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomNavBar extends StatefulWidget {
  const _CustomNavBar({Key? key}) : super(key: key);

  @override
  State<_CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<_CustomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.navBarHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white.withOpacity(0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.85, 1],
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined),
              label: 'Widgets',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: const BoxDecoration(
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
                ),
                child: Padding(
                  padding: AppDimensions.edgeInsets.searchIcon,
                  child: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              label: 'Search',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined),
              label: 'Bookmarks',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.darkNavy,
          unselectedItemColor: Colors.grey.shade400,
          iconSize: 30,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
