import 'package:flutter/material.dart';

import 'package:furniture_ecommerce_app_ui/config/config.dart';
import 'package:furniture_ecommerce_app_ui/models/models.dart';
import 'package:furniture_ecommerce_app_ui/widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  static Route route({required Product product}) {
    return MaterialPageRoute(
      builder: (context) => ProductPage(product: product),
      settings: const RouteSettings(name: '/product'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.productImageBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            _CategoryGradient(size: size, product: product),
            _ProductImage(size: size, product: product),
            _CustomAppBar(isFavorite: product.isFavorite),
            _Details(product: product, size: size),
            _ColorsBox(size: size, color: product.color),
            _AddToCartBar(size: size),
          ],
        ),
      ),
    );
  }
}

class _CategoryGradient extends StatelessWidget {
  const _CategoryGradient({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: size.width / 2 - 0.1 * size.width,
      child: Container(
        width: 0.2 * size.width,
        height: 0.2 * size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [product.color, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              product.category.name,
              style: AppTextStyles.productCategoryName,
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: size.width,
        height: 0.45 * size.height,
        padding: const EdgeInsets.only(top: 50),
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.scaleDown,
          errorBuilder: (_, __, ___) {
            return const Icon(
              Icons.error,
              key: Key('productPageProductImageErrorKey'),
            );
          },
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
    required this.isFavorite,
  }) : super(key: key);

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      left: 20,
      right: 20,
      child: Row(
        children: [
          CustomIconButton(
            onTap: () {
              Navigator.pop<void>(context);
            },
            radius: 20,
            icon: Icons.arrow_back,
            iconColor: Colors.grey.shade700,
          ),
          const Spacer(),
          FavoriteButton(
            key: const Key('productPageFavoriteButtonKey'),
            isFavorite: isFavorite,
            favoriteColor: AppColors.green,
            notFavoriteColor: AppColors.green,
          ),
        ],
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({
    Key? key,
    required this.product,
    required this.size,
  }) : super(key: key);

  final Product product;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: 0.58 * size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: AppTextStyles.productName,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.manufacturer,
                              style: AppTextStyles.productManufacturer,
                            ),
                          ],
                        ),
                        Text(
                          '\$${product.price.toStringAsFixed(product.price.truncateToDouble() == product.price ? 0 : 2)}',
                          style: AppTextStyles.productPrice,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      product.description,
                      textAlign: TextAlign.justify,
                      style: AppTextStyles.productDescription,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'More Chair',
                      style: AppTextStyles.productMoreChair,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 0.13 * size.height,
                child: _MoreChairList(size: size, product: product),
              ),
              SizedBox(
                height: 0.15 * size.height,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoreChairList extends StatelessWidget {
  const _MoreChairList({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 20),
      itemCount: Product.products.length - 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Container(
                    width: 0.13 * size.height,
                    height: 0.13 * size.height,
                    color: AppColors.productImageBackground,
                  ),
                  Image.network(
                    Product.products
                        .where((p) => p.id != product.id)
                        .toList()
                        .elementAt(index)
                        .imageUrl,
                    width: 0.13 * size.height,
                    fit: BoxFit.scaleDown,
                    errorBuilder: (_, __, ___) {
                      return SizedBox(
                        width: 0.13 * size.height,
                        height: 0.13 * size.height,
                        child: const Center(child: Icon(Icons.error)),
                      );
                    },
                  ),
                  Material(
                    key: Key('productPageMoreChairListItemKey$index'),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 0.13 * size.height,
                        height: 0.13 * size.height,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
          ],
        );
      },
    );
  }
}

class _ColorsBox extends StatefulWidget {
  const _ColorsBox({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  final Size size;
  final Color color;

  @override
  State<_ColorsBox> createState() => _ColorsBoxState();
}

class _ColorsBoxState extends State<_ColorsBox> {
  late BoxColors _boxColors;

  @override
  void initState() {
    _boxColors = BoxColors.second;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.42 * widget.size.height - 21,
      left: widget.size.width / 2 - 65,
      child: Container(
        width: 130,
        height: 42,
        padding: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ColorItem(
              key: const Key('productPageFirstColorItemKey'),
              isChecked: _boxColors == BoxColors.first,
              color: AppColors.productBeige,
              onTap: () {
                setState(() {
                  _boxColors = BoxColors.first;
                });
              },
            ),
            _ColorItem(
              key: const Key('productPageSecondColorItemKey'),
              isChecked: _boxColors == BoxColors.second,
              color: widget.color,
              onTap: () {
                setState(() {
                  _boxColors = BoxColors.second;
                });
              },
            ),
            _ColorItem(
              key: const Key('productPageThirdColorItemKey'),
              isChecked: _boxColors == BoxColors.third,
              color: AppColors.productYellow,
              onTap: () {
                setState(() {
                  _boxColors = BoxColors.third;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorItem extends StatelessWidget {
  const _ColorItem({
    Key? key,
    required this.isChecked,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final bool isChecked;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 24,
        decoration: BoxDecoration(
            color: isChecked ? Colors.white : color,
            shape: BoxShape.circle,
            border: Border.all(color: color)),
        child: Center(
          child: Container(
            width: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _AddToCartBar extends StatelessWidget {
  const _AddToCartBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 20,
      right: 20,
      child: Row(
        children: [
          Container(
            width: 0.41 * size.width,
            height: 45,
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: AppColors.productImageBackground,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  key: const Key('productPageDecrementButtonKey'),
                  onTap: () {},
                  icon: Icons.remove,
                  iconColor: AppColors.green,
                  radius: 15,
                ),
                const Text(
                  '01',
                  style: AppTextStyles.productAmount,
                ),
                CustomIconButton(
                  key: const Key('productPageIncrementButtonKey'),
                  onTap: () {},
                  icon: Icons.add,
                  iconColor: AppColors.green,
                  radius: 15,
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                key: const Key('productPageAddToCartButtonKey'),
                onTap: () {},
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Add to cart',
                      style: AppTextStyles.productAddToCart,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
