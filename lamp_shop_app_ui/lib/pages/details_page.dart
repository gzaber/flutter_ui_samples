import 'package:flutter/material.dart';
import 'package:lamp_shop_app_ui/config/config.dart';
import 'package:lamp_shop_app_ui/models/models.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.lamp,
  }) : super(key: key);

  final Lamp lamp;

  static Route route({required Lamp lamp}) {
    return MaterialPageRoute(
      builder: (context) => DetailsPage(lamp: lamp),
      settings: const RouteSettings(name: '/details'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            lamp.imageUrl,
            fit: BoxFit.cover,
          ),
          _CustomAppBar(width: width),
          _WhiteFrame(width: width, height: height),
          _Details(width: width, height: height, lamp: lamp),
          _BuyButton(width: width),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 45,
      left: 0.08 * width,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: AppDimensions.borderRadius.circular10,
            child: Material(
              color: AppColors.detailsBackButton,
              borderRadius: AppDimensions.borderRadius.circular10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: AppDimensions.detailsAppBarIconSize,
                  color: AppColors.lightBlack,
                ),
              ),
            ),
          ),
          const Text(
            'Details',
            style: AppTextStyles.detailsAppBarTitle,
          ),
          ClipRRect(
            borderRadius: AppDimensions.borderRadius.circular10,
            child: Material(
              color: Colors.transparent,
              borderRadius: AppDimensions.borderRadius.circular10,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  size: AppDimensions.detailsAppBarIconSize,
                  color: AppColors.lightBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WhiteFrame extends StatelessWidget {
  const _WhiteFrame({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.08 * width - 10,
      right: 0,
      top: 0.535 * height - 10,
      bottom: 0,
      child: Container(
        decoration: AppBoxDecoration.whiteFrame,
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({
    Key? key,
    required this.width,
    required this.height,
    required this.lamp,
  }) : super(key: key);

  final double width;
  final double height;
  final Lamp lamp;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.08 * width,
      right: 0,
      top: 0.535 * height,
      bottom: 0,
      child: Container(
        decoration: AppBoxDecoration.details,
        child: Column(
          children: [
            _DetailsHeader(lamp: lamp),
            const _ColorBar(),
            _Description(description: lamp.description),
          ],
        ),
      ),
    );
  }
}

class _BuyButton extends StatelessWidget {
  const _BuyButton({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: AppDimensions.borderRadius.detailsBuyButton,
        child: Material(
          color: AppColors.darkNavy,
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 0.83 * width,
              height: 0.23 * width,
              child: const Center(
                child: Text(
                  'Shop Now',
                  style: AppTextStyles.detailsBuyButton,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailsHeader extends StatelessWidget {
  const _DetailsHeader({
    Key? key,
    required this.lamp,
  }) : super(key: key);

  final Lamp lamp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.edgeInsets.detailsHeader,
      child: Row(
        children: [
          Expanded(
            child: Text(
              lamp.name,
              style: AppTextStyles.detailsHeaderName,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: AppTextStyles.detailsPriceLabel,
              ),
              const SizedBox(height: 5),
              Text(
                lamp.price,
                style: AppTextStyles.detailsPriceValue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorBar extends StatelessWidget {
  const _ColorBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.edgeInsets.detailsColorBar,
      child: Row(
        children: [
          const Icon(Icons.add, size: 30),
          const Spacer(),
          Container(
            padding: AppDimensions.edgeInsets.detailsColorBarInner,
            decoration: AppBoxDecoration.colorBar,
            child: Row(
              children: [
                Text(
                  'Color',
                  style: AppTextStyles.detailsColorLabel,
                ),
                Container(
                  margin: AppDimensions.edgeInsets.detailsHorizontalLine,
                  width: 2,
                  height: 22,
                  color: AppColors.detailsHorizontalLine,
                ),
                const _ColorBox(color: AppColors.colorBox1),
                const SizedBox(width: 15),
                const _ColorBox(
                  color: AppColors.colorBox2,
                  isChecked: true,
                ),
                const SizedBox(width: 15),
                const _ColorBox(color: AppColors.colorBox3),
                const SizedBox(width: 15),
                const _ColorBox(color: AppColors.colorBox4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox({
    Key? key,
    required this.color,
    this.isChecked = false,
  }) : super(key: key);

  final Color color;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isChecked ? 35 : 25,
      height: isChecked ? 35 : 25,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: isChecked
          ? Center(
              child: Container(
                width: 15,
                height: 15,
                decoration: AppBoxDecoration.colorBoxChecked,
                child: Icon(Icons.check, size: 12, color: color),
              ),
            )
          : null,
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.edgeInsets.detailsDescription,
      child: Text(
        description,
        style: AppTextStyles.detailsDescription,
      ),
    );
  }
}
