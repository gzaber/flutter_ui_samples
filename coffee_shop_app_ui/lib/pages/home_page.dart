import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:coffee_shop_app_ui/config/app_colors.dart';
import 'package:coffee_shop_app_ui/models/models.dart';
import 'package:coffee_shop_app_ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final coffees = coffeeList;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 90),
                const _Header(),
                const _Search(),
                const SizedBox(height: 40),
                _CoffeeTypes(width: size.width),
                const SizedBox(height: 18),
                _Coffees(width: size.width, coffees: coffees),
                Placeholder(
                  fallbackWidth: size.width,
                  fallbackHeight: 400,
                ),
              ],
            ),
          ),
          Positioned(
            child: CustomAppBar(
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
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: 90,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Text(
        'Find the best\ncoffee for you',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightBlack,
          contentPadding: EdgeInsets.zero,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 20, right: 15),
            child: Icon(
              Icons.search,
              size: 20,
              color: AppColors.grey,
            ),
          ),
          labelText: 'Find Your Coffee...',
          labelStyle: const TextStyle(
            color: AppColors.grey,
            fontSize: 11,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}

class _CoffeeTypes extends StatefulWidget {
  const _CoffeeTypes({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<_CoffeeTypes> createState() => _CoffeeTypesState();
}

class _CoffeeTypesState extends State<_CoffeeTypes> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width - 25,
      height: 40,
      child: Stack(
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            itemCount: CoffeeType.values.length,
            itemBuilder: (context, index) {
              return _CoffeeTypeItem(
                coffeeType: CoffeeType.values[index],
                isActive: index == activeIndex,
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
              );
            },
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    AppColors.black,
                    AppColors.black.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CoffeeTypeItem extends StatelessWidget {
  const _CoffeeTypeItem({
    Key? key,
    required this.coffeeType,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final CoffeeType coffeeType;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Text(
          isActive ? '${coffeeType.name}\n\u25CF' : coffeeType.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? AppColors.orange : AppColors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}

class _Coffees extends StatelessWidget {
  const _Coffees({
    Key? key,
    required this.width,
    required this.coffees,
  }) : super(key: key);

  final double width;
  final List<Coffee> coffees;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 25),
        itemCount: coffees.length,
        itemBuilder: (context, index) {
          return _CoffeeItem(coffee: coffees[index]);
        },
      ),
    );
  }
}

class _CoffeeItem extends StatelessWidget {
  const _CoffeeItem({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 230,
      margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF262B33),
            Color(0xFF0C0F14),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CoffeeItemImage(coffee: coffee),
          _CoffeeItemDetails(coffee: coffee),
        ],
      ),
    );
  }
}

class _CoffeeItemImage extends StatelessWidget {
  const _CoffeeItemImage({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: NetworkImage(coffee.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 45,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.orange,
                      size: 13,
                    ),
                    Text(
                      ' ${coffee.rating}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CoffeeItemDetails extends StatelessWidget {
  const _CoffeeItemDetails({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            coffee.type.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            'With ${coffee.mainAddition}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: '\$',
                  style: const TextStyle(
                    color: AppColors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' ${coffee.price}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Material(
                color: AppColors.orange,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: const SizedBox(
                    width: 28,
                    height: 28,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
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
