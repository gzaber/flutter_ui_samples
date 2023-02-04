import 'dart:math';
import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app_ui/config/config.dart';
import 'package:furniture_ecommerce_app_ui/models/models.dart';
import 'package:furniture_ecommerce_app_ui/pages/pages.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _BackgroundImage(size: size),
          const _SkipButton(),
          _Description(size: size),
          _Bottom(height: size.height),
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Image.network(
        Product.introImageUrl,
        width: size.width,
        height: 0.66 * size.height,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return SizedBox(
            width: size.width,
            height: 0.66 * size.height,
            child: const Icon(Icons.error),
          );
        },
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 10,
      child: TextButton(
        key: const Key('introPageSkipButtonKey'),
        style: TextButton.styleFrom(padding: const EdgeInsets.all(10)),
        onPressed: () {
          Navigator.push<void>(context, HomePage.route());
        },
        child: const Text('Skip', style: AppTextStyles.introSkipButton),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipPath(
        clipper: _CustomClipper(),
        child: Container(
          width: size.width,
          height: 0.52 * size.height,
          color: AppColors.darkBlue,
          child: Padding(
            padding: EdgeInsets.only(
                left: 25, top: 0.21 * 0.52 * size.height, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Decorate Your', style: AppTextStyles.introMediumTitle),
                Text('Dream Home', style: AppTextStyles.introLargeTitle),
                SizedBox(height: 10),
                Text(
                  'Furniture must have a personality as\nwell as be beautiful.',
                  style: AppTextStyles.introBody,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.08 * height,
      left: 25,
      right: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _DotsRow(),
          _NextButton(),
        ],
      ),
    );
  }
}

class _DotsRow extends StatelessWidget {
  const _DotsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(radius: 7, backgroundColor: Colors.white),
        SizedBox(width: 12),
        CircleAvatar(radius: 7, backgroundColor: AppColors.lightBlue),
        SizedBox(width: 12),
        CircleAvatar(radius: 7, backgroundColor: AppColors.lightBlue),
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('introPageNextButtonKey'),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.lightBlue,
        padding: const EdgeInsets.fromLTRB(35, 17, 35, 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('Next', style: AppTextStyles.introNextButton),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Transform.rotate(
              angle: -pi / 4,
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path();

    path.moveTo(0, 0.1 * height);
    path.arcToPoint(
      Offset(0.15 * width, 0),
      radius: const Radius.circular(45),
    );
    path.lineTo(0.94 * width, 0.24 * height);
    path.arcToPoint(
      Offset(width, 0.31 * height),
      radius: const Radius.circular(30),
    );
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

// coverage:ignore-start
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  // coverage:ignore-end

}
