import 'package:flutter/material.dart';
import 'package:lamp_shop_app_ui/config/config.dart';

import 'package:lamp_shop_app_ui/models/models.dart';
import 'package:lamp_shop_app_ui/pages/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context: context);
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
      padding: AppConfig.dimensions.edgeInsets.header,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: AppConfig.dimensions.borderRadius.circular30,
                child: Image.network(
                  Lamp.headerLampUrl,
                  width: double.infinity,
                  height: AppConfig.dimensions.headerImageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: AppConfig.dimensions.scalable(25),
                left: AppConfig.dimensions.scalable(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.light,
                      size: AppConfig.dimensions.scalable(30),
                      color: Colors.white,
                    ),
                    SizedBox(width: AppConfig.dimensions.scalable(10)),
                    Text('Moli', style: AppConfig.textStyles.headerTitle),
                  ],
                ),
              ),
              Positioned(
                bottom: AppConfig.dimensions.scalable(15),
                left: AppConfig.dimensions.scalable(20),
                right: AppConfig.dimensions.scalable(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The most\nUnique Lights',
                          style: AppConfig.textStyles.headerHeadline,
                        ),
                        SizedBox(height: AppConfig.dimensions.scalable(5)),
                        Text(
                          'For Daily Living.',
                          style: AppConfig.textStyles.headerBody,
                        ),
                      ],
                    ),
                    SizedBox(width: AppConfig.dimensions.scalable(10)),
                    ClipRRect(
                      borderRadius:
                          AppConfig.dimensions.borderRadius.circular20,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding:
                              AppConfig.dimensions.edgeInsets.exploreButton,
                        ),
                        child: Text(
                          'Explore',
                          style: AppConfig.textStyles.headerButton,
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
  const _GridViewTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConfig.dimensions.edgeInsets.gridViewTitle,
      child: Text(
        'New Arrivals',
        style: AppConfig.textStyles.gridViewTitle,
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
      padding: AppConfig.dimensions.edgeInsets.gridView,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: AppConfig.dimensions.gridItemAspectRatio,
        crossAxisSpacing: AppConfig.dimensions.scalable(15),
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
              borderRadius: AppConfig.dimensions.borderRadius.circular20,
              child: Material(
                child: Ink.image(
                  image: image,
                  width: double.infinity,
                  height: AppConfig.dimensions.inkImageHeight,
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
              bottom: AppConfig.dimensions.scalable(10),
              right: AppConfig.dimensions.scalable(10),
              child: Material(
                color: AppColors.darkNavy,
                shape: RoundedRectangleBorder(
                  borderRadius: AppConfig.dimensions.borderRadius.circular30,
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: AppConfig.dimensions.borderRadius.circular30,
                  child: CircleAvatar(
                    radius: AppConfig.dimensions.scalable(22),
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.add,
                      size: AppConfig.dimensions.scalable(23),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                lamp.name,
                style: AppConfig.textStyles.gridViewItemName,
              ),
              SizedBox(height: AppConfig.dimensions.scalable(5)),
              Text(
                lamp.price,
                style: AppConfig.textStyles.gridViewItemPrice,
              ),
            ],
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
      height: AppConfig.dimensions.navBarHeight,
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
                  padding: AppConfig.dimensions.edgeInsets.searchIcon,
                  child: Icon(
                    Icons.search,
                    size: AppConfig.dimensions.scalable(25),
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
          iconSize: AppConfig.dimensions.scalable(30),
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
