import 'dart:ui';

import 'package:flutter/material.dart';

import '../config/config.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            key: const Key('homePageSingleChildScrollViewKey'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 90),
                const _Header(),
                const _Search(),
                const SizedBox(height: 40),
                _CoffeeTypes(width: size.width),
                const SizedBox(height: 18),
                _Coffees(
                  width: size.width,
                  coffees: coffees,
                ),
                const _SpecialHeader(),
                _Specials(width: size.width),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            child: CustomAppBar(
              width: size.width,
              leading: CustomAppBarButton(
                key: const Key('homePageMenuButtonKey'),
                icon: Icons.apps,
                onTap: () {},
              ),
              trailing: CustomImageButton(
                key: const Key('homePageProfileButtonKey'),
                imageUrl:
                    'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                onTap: () {},
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: _CustomNavBar(size: size),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Text(
        'Find the best\ncoffee for you',
        style: AppTextStyles.homeHeader,
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({Key? key}) : super(key: key);

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
          labelStyle: AppTextStyles.homeSearchLabel,
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
                key: Key('homePageCoffeeTypeItemKey$index'),
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
            letterSpacing: 0.3,
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
          return _CoffeeItem(
            coffee: coffees[index],
            key: Key('homePageCoffeeItemKey$index'),
          );
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
    return GestureDetector(
      onTap: () =>
          Navigator.push<void>(context, CoffeePage.route(coffee: coffee)),
      child: Container(
        width: 150,
        height: 230,
        margin: const EdgeInsets.only(right: 25),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: AppGradients.homeCard,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CoffeeItemImage(coffee: coffee),
            _CoffeeItemDetails(coffee: coffee),
          ],
        ),
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
        _ImageContainer(imageUrl: coffee.imageUrl),
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
                child: FittedBox(
                  fit: BoxFit.none,
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
                        style: AppTextStyles.homeRating,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Image.network(
        imageUrl,
        width: 130,
        height: 130,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return SizedBox(
            key: Key('homePageImageContainerErrorKey$imageUrl'),
            width: 130,
            height: 130,
            child: const Icon(Icons.error_outline, color: Colors.white),
          );
        },
      ),
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
      child: FittedBox(
        fit: BoxFit.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coffee.type.name,
              style: AppTextStyles.homeCoffeeItemName,
            ),
            const SizedBox(height: 3),
            Text(
              'With ${coffee.mainAddition}',
              style: AppTextStyles.homeCoffeeItemAddition,
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: '\$',
                    style: AppTextStyles.homeCoffeeItemDollarSign,
                    children: [
                      TextSpan(
                        text:
                            ' ${coffee.price.toStringAsFixed(coffee.price.truncateToDouble() == coffee.price ? 0 : 2)}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 39),
                Material(
                  color: AppColors.orange,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: InkWell(
                    key: Key('homePageAddCoffeeButtonKey${coffee.imageUrl}'),
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
      ),
    );
  }
}

class _SpecialHeader extends StatelessWidget {
  const _SpecialHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 33),
      child: Text(
        'Special for you',
        style: AppTextStyles.homeSpecialHeader,
      ),
    );
  }
}

class _Specials extends StatelessWidget {
  const _Specials({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        specials.length,
        (index) => _SpecialItem(
          width: width,
          title: specials[index].title,
          subtitle: specials[index].subtitle,
          imageUrl: specials[index].imageUrl,
        ),
      ),
    );
  }
}

class _SpecialItem extends StatelessWidget {
  const _SpecialItem({
    Key? key,
    required this.width,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  }) : super(key: key);

  final double width;
  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width - 50,
      height: 150,
      margin: const EdgeInsets.only(left: 25, right: 25, top: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppGradients.homeCard,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImageContainer(
            imageUrl: imageUrl,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Text(
                  title,
                  style: AppTextStyles.homeSpecialItemTitle,
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: AppTextStyles.homeSpecialItemSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatefulWidget {
  const _CustomNavBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<_CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<_CustomNavBar> {
  final icons = [
    Icons.home,
    Icons.shopping_bag,
    Icons.favorite,
    Icons.notifications,
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: widget.size.width,
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.9),
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              icons.length,
              (index) => GestureDetector(
                key: Key('homePageCustomNavBarItemKey$index'),
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: Stack(
                  children: [
                    Icon(
                      icons[index],
                      color: activeIndex == index
                          ? AppColors.orange
                          : AppColors.grey,
                    ),
                    if (icons[index] == icons.last)
                      const Positioned(
                        right: 5,
                        top: 5,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 3,
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
