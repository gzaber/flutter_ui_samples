import 'package:flutter/material.dart';

import 'package:lamp_shop_app_ui/models/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final lamps = Lamp.lamps;

    return Scaffold(
      bottomNavigationBar: _CustomNavBar(width: width),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(width: width),
            const _GridViewTitle(),
            GridView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.64,
                mainAxisSpacing: 5,
                crossAxisSpacing: 20,
              ),
              itemCount: lamps.length,
              itemBuilder: (_, index) {
                return _GridItem(lamp: lamps[index], width: width);
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _CustomNavBar extends StatefulWidget {
  const _CustomNavBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<_CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<_CustomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
            const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.widgets_outlined), label: 'Widgets'),
            BottomNavigationBarItem(
              icon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF151D30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 12,
                      spreadRadius: 2,
                      offset: Offset(0.0, 8.0),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              label: 'Search',
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.bookmarks_outlined), label: 'Bookmarks'),
            const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xFF151D30),
          unselectedItemColor: Colors.grey,
          iconSize: 32,
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

class _GridItem extends StatelessWidget {
  const _GridItem({
    Key? key,
    required this.lamp,
    required this.width,
  }) : super(key: key);

  final Lamp lamp;
  final double width;

  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(lamp.imageUrl);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                child: Ink.image(
                  image: image,
                  width: double.infinity,
                  height: width * 0.47,
                  fit: BoxFit.cover,
                  child: InkWell(onTap: () {}),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Material(
                color: const Color(0xFF151D30),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lamp.name,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color(0xFF444444),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                lamp.price,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: const Color(0xFF444444)),
              ),
            ],
          ),
        ),
      ],
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
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 30),
      child: Text(
        'New Arrivals',
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF444444),
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
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  Lamp.headerLampUrl,
                  height: width * 0.72,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 25,
                left: 20,
                child: Row(
                  children: [
                    const Icon(
                      Icons.light,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Moli',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                left: 20,
                right: 15,
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'The most\nUnique Lights',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'For Daily Living.',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                          ),
                          child: Text(
                            'Explore',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: const Color(0xFF444444),
                                  fontWeight: FontWeight.bold,
                                ),
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
