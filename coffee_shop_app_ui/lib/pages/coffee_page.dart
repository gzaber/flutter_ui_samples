import 'package:flutter/material.dart';

import 'package:coffee_shop_app_ui/config/config.dart';
import 'package:coffee_shop_app_ui/models/models.dart';
import 'package:coffee_shop_app_ui/widgets/widgets.dart';

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
      body: Column(
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
                  onTap: () => Navigator.pop(context),
                ),
                trailing: CustomAppBarButton(
                  isTransparent: true,
                  icon: Icons.favorite,
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                bottom: 0,
                child: _CoffeeDetails(size: size, coffee: coffee),
              )
            ],
          ),
        ],
      ),
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
    return Container(
      width: size.width,
      height: 0.57 * size.height,
      margin: const EdgeInsets.only(left: 15, top: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        image: DecorationImage(
          image: NetworkImage(coffee.imageUrl),
          fit: BoxFit.cover,
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
    return Container(
      width: size.width - 30,
      height: 0.17 * size.height,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(1),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.type.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'With ${coffee.mainAddition}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
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
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '(${coffee.reviewers})',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          _BaseIngredients(coffee: coffee),
        ],
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w200,
                  ),
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
