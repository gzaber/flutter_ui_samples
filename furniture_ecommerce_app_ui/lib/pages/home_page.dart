import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app_ui/config/config.dart';

import 'package:furniture_ecommerce_app_ui/models/models.dart';
import 'package:furniture_ecommerce_app_ui/pages/pages.dart';
import 'package:furniture_ecommerce_app_ui/widgets/widgets.dart';

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
    final products = Product.products;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.homeStartGradient, AppColors.homeEndGradient],
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
                  style: AppTextStyles.homeTitleLarge,
                ),
                SizedBox(height: 5),
                Text(
                  'For your home',
                  style: AppTextStyles.homeTitleMedium,
                ),
              ],
            ),
            CustomIconButton(
              key: const Key('homePageSearchButtonKey'),
              onTap: () {},
              icon: Icons.search,
              iconSize: 22,
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
      key: Key('homePageCategoryButtonKey${category.name}'),
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
        key: Key('homePageProductCardKey${product.imageUrl}'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: InkWell(
          onTap: () {
            Navigator.push<void>(context, ProductPage.route(product: product));
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
                          Container(
                            width: 0.38 * size.width,
                            height: 0.38 * size.width,
                            color: AppColors.homeImageBackground,
                          ),
                          Image.network(
                            product.imageUrl,
                            width: 0.38 * size.width,
                            height: 0.38 * size.width,
                            fit: BoxFit.scaleDown,
                            errorBuilder: (_, __, ___) {
                              return SizedBox(
                                key: Key(
                                    'homePageImageErrorKey${product.imageUrl}'),
                                width: 0.38 * size.width,
                                height: 0.38 * size.width,
                                child: const Icon(Icons.error),
                              );
                            },
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: FavoriteButton(
                              key: Key(
                                  'homePageFavoriteButtonKey${product.imageUrl}'),
                              isFavorite: product.isFavorite,
                              iconSize: 14,
                              radius: 12,
                              favoriteColor: AppColors.productBlue,
                              notFavoriteColor: AppColors.green,
                            ),
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
                            style: AppTextStyles.homeProductName,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            product.manufacturer,
                            style: AppTextStyles.productManufacturer,
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
                                style: AppTextStyles.homeProductRating,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${product.price.toStringAsFixed(product.price.truncateToDouble() == product.price ? 0 : 2)}',
                                style: AppTextStyles.homeProductPrice,
                              ),
                              CustomIconButton(
                                key: Key(
                                    'homePageAddProductButtonKey${product.imageUrl}'),
                                onTap: () {},
                                icon: Icons.add,
                                iconSize: 21,
                                iconColor: Colors.white,
                                backgroundColor: AppColors.green,
                                radius: 17,
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
