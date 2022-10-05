import 'package:flutter/material.dart';

import 'package:furniture_ecommerce_app_ui/config/app_colors.dart';
import 'package:furniture_ecommerce_app_ui/models/models.dart';
import 'package:furniture_ecommerce_app_ui/pages/pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
      settings: const RouteSettings(name: '/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categories = Category.categories;
    const products = Product.products;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.grey, AppColors.lightGrey],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            _CustomAppBar(height: size.height),
            _Categories(categories: categories),
            SizedBox(height: 0.03 * size.height),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _ProductCard(product: products[index], size: size);
                  }),
            ),
          ],
        ),
        bottomNavigationBar: const _CustomNavBar(),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.16 * height,
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Modern Furniture',
                  style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.3,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'For your home',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Ink(
              width: 40,
              height: 40,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
              ),
              child: IconButton(
                onPressed: () {},
                splashRadius: 20,
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 25),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: _CategoryButton(category: categories[index]),
          );
        }),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: category.isChecked ? AppColors.green : Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Icon(
                category.icon,
                size: 20,
                color: category.isChecked ? Colors.white : AppColors.green,
              ),
              const SizedBox(width: 6),
              Text(
                category.name,
                style: TextStyle(
                  color: category.isChecked ? Colors.white : AppColors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    Key? key,
    required this.product,
    required this.size,
  }) : super(key: key);

  final Product product;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: InkWell(
          onTap: () {
            Navigator.push(context, ProductPage.route(product: product));
          },
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 0.38 * size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.network(
                            product.imageUrl,
                            width: 0.38 * size.width,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child:
                                _FavoriteButton(isFavorite: product.isFavorite),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.6,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            product.manufacturer,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '(${product.rating})',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${product.price.toStringAsFixed(product.price.truncateToDouble() == product.price ? 0 : 2)}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Material(
                                color: AppColors.green,
                                shape: const CircleBorder(),
                                child: InkWell(
                                  onTap: () {},
                                  customBorder: const CircleBorder(),
                                  child: const CircleAvatar(
                                    radius: 17,
                                    backgroundColor: Colors.transparent,
                                    child: Icon(Icons.add,
                                        size: 21, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatefulWidget {
  const _FavoriteButton({
    Key? key,
    required this.isFavorite,
  }) : super(key: key);

  final bool isFavorite;

  @override
  State<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<_FavoriteButton> {
  late bool _isFavorite;

  @override
  void initState() {
    _isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () {
          setState(() {
            _isFavorite = !_isFavorite;
          });
        },
        customBorder: const CircleBorder(),
        child: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.transparent,
          child: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_outline,
            size: 14,
            color: Colors.black,
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
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.green,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '\u25CF'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: '\u25CF'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: '\u25CF'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: '\u25CF'),
      ],
    );
  }
}
