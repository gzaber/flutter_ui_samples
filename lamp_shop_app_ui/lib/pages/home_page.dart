import 'package:flutter/material.dart';

import 'package:lamp_shop_app_ui/config/config.dart';
import 'package:lamp_shop_app_ui/models/models.dart';
import 'package:lamp_shop_app_ui/pages/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lamps = Lamp.lamps;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: const _CustomNavBar(),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(width: width),
            const _GridViewTitle(),
            _GridView(lamps: lamps, width: width),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.edgeInsets.homeHeader,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: AppDimensions.borderRadius.circular30,
                child: Image.network(
                  Lamp.headerLampUrl,
                  width: width,
                  height: AppDimensions.homeHeaderImageRatio * width,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      key: const Key('homePageHeaderError'),
                      color: Colors.red,
                      width: width,
                      height: AppDimensions.homeHeaderImageRatio * width,
                      child: const Center(child: Icon(Icons.error)),
                    );
                  },
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Row(
                  children: const [
                    Icon(
                      Icons.light,
                      size: 25,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text('Moli', style: AppTextStyles.homeHeaderTitle),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                right: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'The Most\nUnique Lights',
                            style: AppTextStyles.homeHeaderHeadline,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'For Daily Living.',
                            style: AppTextStyles.homeHeaderBody,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    ClipRRect(
                      borderRadius: AppDimensions.borderRadius.circular15,
                      child: TextButton(
                        key: const Key('homePageHeaderTextButtonKey'),
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: AppDimensions.edgeInsets.homeExploreButton,
                        ),
                        child: const Text(
                          'Explore',
                          style: AppTextStyles.homeHeaderButton,
                        ),
                      ),
                    ),
                  ],
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
  const _GridViewTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.edgeInsets.homeGridViewTitle,
      child: const Text(
        'New Arrivals',
        style: AppTextStyles.homeGridViewTitle,
      ),
    );
  }
}

class _GridView extends StatelessWidget {
  const _GridView({
    Key? key,
    required this.lamps,
    required this.width,
  }) : super(key: key);

  final List<Lamp> lamps;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppDimensions.edgeInsets.homeGridView,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: AppDimensions.homeGridItemRatio,
        crossAxisSpacing: 17,
      ),
      itemCount: lamps.length,
      itemBuilder: (_, index) {
        return _GridViewItem(lamp: lamps[index], width: width);
      },
    );
  }
}

class _GridViewItem extends StatelessWidget {
  const _GridViewItem({
    Key? key,
    required this.lamp,
    required this.width,
  }) : super(key: key);

  final Lamp lamp;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppDimensions.borderRadius.circular20,
          child: Stack(
            children: [
              Image.network(
                lamp.imageUrl,
                width: width / 2,
                height: AppDimensions.homeInkImageRatio * width,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: Colors.red,
                    width: width / 2,
                    height: AppDimensions.homeInkImageRatio * width,
                    child: const Center(child: Icon(Icons.error)),
                  );
                },
              ),
              Material(
                key: Key('homePageGridViewItem${lamp.imageUrl}'),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push<void>(
                        context, DetailsPage.route(lamp: lamp));
                  },
                  child: SizedBox(
                    width: width / 2,
                    height: AppDimensions.homeInkImageRatio * width,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: _AddItemButton(
                  key: Key('homePageGridViewItemAddKey${lamp.imageUrl}'),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lamp.name,
              softWrap: false,
              style: AppTextStyles.homeGridViewItemName,
            ),
            const SizedBox(height: 5),
            Text(
              lamp.price,
              style: AppTextStyles.homeGridViewItemPrice,
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

class _AddItemButton extends StatelessWidget {
  const _AddItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.darkNavy,
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadius.circular30,
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: AppDimensions.borderRadius.circular30,
        child: const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.add,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
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
      height: AppDimensions.homeNavBarHeight,
      decoration: AppBoxDecoration.customNavBar,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: AppDimensions.homeNavBarIconSize,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.widgets_outlined,
                size: AppDimensions.homeNavBarIconSize,
              ),
              label: 'Widgets',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: AppBoxDecoration.customNavBarItem,
                child: Padding(
                  padding: AppDimensions.edgeInsets.homeSearchIcon,
                  child: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              label: 'Search',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmarks_outlined,
                size: AppDimensions.homeNavBarIconSize,
              ),
              label: 'Bookmarks',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: AppDimensions.homeNavBarIconSize,
              ),
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
