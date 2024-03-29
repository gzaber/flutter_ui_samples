import 'dart:ui';

import 'package:flutter/material.dart';

import '../config/config.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class CoffeePage extends StatelessWidget {
  const CoffeePage({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  static Route route({required Coffee coffee}) {
    return MaterialPageRoute(
      builder: (context) => CoffeePage(coffee: coffee),
      settings: const RouteSettings(name: '/coffee'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _CoffeeImage(size: size, coffee: coffee),
                CustomAppBar(
                  width: size.width,
                  isTransparent: true,
                  leading: CustomAppBarButton(
                    isTransparent: true,
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop<void>(context),
                  ),
                  trailing: const _FavoriteButton(),
                ),
                Positioned(
                  bottom: 0,
                  child: _CoffeeDetails(size: size, coffee: coffee),
                )
              ],
            ),
            _Description(coffee: coffee),
            const _Size(),
            _BuyNow(coffee: coffee),
          ],
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatefulWidget {
  const _FavoriteButton({Key? key}) : super(key: key);

  @override
  State<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<_FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CustomAppBarButton(
      isTransparent: true,
      icon: Icons.favorite,
      color: isFavorite ? AppColors.orange : AppColors.grey,
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class _CoffeeImage extends StatelessWidget {
  const _CoffeeImage({
    Key? key,
    required this.size,
    required this.coffee,
  }) : super(key: key);

  final Size size;
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Image.network(
          coffee.imageUrl,
          width: size.width - 30,
          height: 456,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return SizedBox(
              key: const Key('coffeePageCoffeeImageErrorKey'),
              width: size.width - 30,
              height: 456,
              child: const Icon(Icons.error_outline, color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}

class _CoffeeDetails extends StatelessWidget {
  const _CoffeeDetails({
    Key? key,
    required this.size,
    required this.coffee,
  }) : super(key: key);

  final Size size;
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            width: size.width - 30,
            height: 138,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coffee.type.name,
                            style: AppTextStyles.coffeeDetailsName,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'With ${coffee.mainAddition}',
                            style: AppTextStyles.coffeeDetailsAddition,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: AppColors.orange,
                          ),
                          const SizedBox(width: 8),
                          RichText(
                            text: TextSpan(
                              text: '${coffee.rating} ',
                              style: AppTextStyles.coffeeRating,
                              children: [
                                TextSpan(
                                  text: '(${coffee.reviewers})',
                                  style: AppTextStyles.coffeeReviewers,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, right: 30),
                  child: _BaseIngredients(coffee: coffee),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BaseIngredients extends StatelessWidget {
  const _BaseIngredients({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              coffee.type.baseIngredients.length,
              (index) =>
                  _Ingredient(ingredient: coffee.type.baseIngredients[index]),
            ),
          ),
          const SizedBox(height: 10),
          if (coffee.type.isMediumRoasted)
            Container(
              width: 100,
              height: 30,
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Center(
                child: Text(
                  'Medium Roasted',
                  style: AppTextStyles.coffeeBaseIngredients,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Ingredient extends StatelessWidget {
  const _Ingredient({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              ingredient.icon,
              size: 20,
              color: AppColors.orange,
            ),
            const SizedBox(height: 3),
            Text(
              ingredient.name,
              style: AppTextStyles.coffeeBaseIngredients,
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 23, bottom: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _TitleText(title: 'Description'),
          const SizedBox(height: 6),
          RichText(
            text: TextSpan(
              text: coffee.type.description,
              style: AppTextStyles.coffeeDescription,
              children: const [
                TextSpan(
                  text: '... Read More',
                  style: TextStyle(color: AppColors.orange),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.coffeeTitleText,
    );
  }
}

class _Size extends StatefulWidget {
  const _Size({Key? key}) : super(key: key);

  @override
  State<_Size> createState() => _SizeState();
}

class _SizeState extends State<_Size> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _TitleText(title: 'Size'),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              CoffeeSize.values.length,
              (index) => _SizeItem(
                key: Key(
                    'coffeePageSizeItemKey${CoffeeSize.values[index].name[0].toUpperCase()}'),
                title: CoffeeSize.values[index].name[0].toUpperCase(),
                isActive: activeIndex == index,
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SizeItem extends StatelessWidget {
  const _SizeItem({
    Key? key,
    required this.title,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 95,
        height: 30,
        decoration: BoxDecoration(
          color: isActive ? AppColors.black : AppColors.lightBlack,
          borderRadius: BorderRadius.circular(10),
          border: isActive
              ? Border.all(
                  width: 1,
                  color: AppColors.orange,
                )
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? AppColors.orange : Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  const _BuyNow({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const _TitleText(title: 'Price'),
              const SizedBox(height: 3),
              RichText(
                text: TextSpan(
                  text: '\$',
                  style: AppTextStyles.coffeeBuyNowDollarSign,
                  children: [
                    TextSpan(
                      text:
                          ' ${coffee.price.toStringAsFixed(coffee.price.truncateToDouble() == coffee.price ? 0 : 2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Material(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              key: const Key('coffeePageBuyNowButtonKey'),
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: const SizedBox(
                width: 215,
                height: 55,
                child: Center(
                  child: Text(
                    'Buy Now',
                    style: AppTextStyles.coffeeBuyNowButton,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
