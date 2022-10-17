import 'package:flutter/material.dart';

import 'package:smartest_home_app_ui/config/config.dart';
import 'package:smartest_home_app_ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        height: 0.1 * size.height,
        leadingIcon: Icons.menu,
        trailingIcon: Icons.notifications_outlined,
      ),
      body: Column(
        children: [
          const _EnvironmentalConditions(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 35),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: const [
                  _PowerUsage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnvironmentalConditions extends StatelessWidget {
  const _EnvironmentalConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _WeatherCondition(
              description: 'Lightning', icon: Icons.thunderstorm_outlined),
          _TemperatureCondition(description: 'Temp Outside', value: 19),
          _TemperatureCondition(description: 'Temp Indoor', value: 25),
        ],
      ),
    );
  }
}

class _WeatherCondition extends StatelessWidget {
  const _WeatherCondition({
    Key? key,
    required this.description,
    required this.icon,
  }) : super(key: key);

  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 33,
        ),
        const Spacer(),
        Text(
          description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _TemperatureCondition extends StatelessWidget {
  const _TemperatureCondition({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);

  final String description;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              '°C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            )
          ],
        ),
        const Spacer(),
        Text(
          description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _PowerUsage extends StatelessWidget {
  const _PowerUsage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
      decoration: const BoxDecoration(
        color: Colors.amber, //AppColors.grey,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        children: const [
          _PowerUsageItem(
            value: 29.5,
            icon: Icons.electrical_services,
          ),
        ],
      ),
    );
  }
}

class _PowerUsageItem extends StatelessWidget {
  const _PowerUsageItem({
    Key? key,
    required this.value,
    required this.icon,
  }) : super(key: key);

  final double value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Column(
          children: [
            RichText(
              text: TextSpan(
                text: value.toString(),
                style: const TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 20,
                ),
                children: const [
                  TextSpan(
                    text: ' KwH',
                    style: TextStyle(
                      color: AppColors.darkBrown,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            const Text(
              'Power usage today',
              style: TextStyle(
                color: AppColors.darkBrown,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
