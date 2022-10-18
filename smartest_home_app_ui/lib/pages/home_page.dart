import 'package:flutter/material.dart';

import 'package:smartest_home_app_ui/config/config.dart';
import 'package:smartest_home_app_ui/models/models.dart';
import 'package:smartest_home_app_ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const scenes = Scene.scenes;

    return Scaffold(
      appBar: CustomAppBar(
        height: 0.1 * size.height,
        leadingIcon: Icons.menu,
        trailingIcon: Icons.notifications_outlined,
      ),
      body: Column(
        children: [
          const _EnvironmentalConditions(),
          CustomExpandedContainer(
            color: Colors.white,
            child: Column(
              children: [
                const _PowerUsage(),
                CustomExpandedContainer(
                  color: AppColors.lightGrey,
                  child: Column(
                    children: const [
                      CustomHeader(title: 'Scenes'),
                      _Scenes(scenes: scenes),
                      CustomHeader(title: 'Rooms', paddingTop: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Scenes extends StatefulWidget {
  const _Scenes({
    Key? key,
    required this.scenes,
  }) : super(key: key);

  final List<Scene> scenes;

  @override
  State<_Scenes> createState() => _ScenesState();
}

class _ScenesState extends State<_Scenes> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: widget.scenes.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 25),
          itemBuilder: (_, index) {
            return _SceneItem(
              scene: widget.scenes[index],
              isActive: index == activeIndex,
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
            );
          }),
    );
  }
}

class _SceneItem extends StatelessWidget {
  const _SceneItem({
    Key? key,
    required this.scene,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final Scene scene;

  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17, bottom: 15),
      child: Material(
        color: isActive ? AppColors.brown : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            width: 85,
            height: 85,
            decoration: isActive
                ? const BoxDecoration(
                    color: AppColors.brown,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.brown,
                        spreadRadius: -8,
                        blurRadius: 10,
                        offset: Offset(0, 15),
                      ),
                    ],
                  )
                : null,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    scene.icon,
                    color: isActive ? Colors.white : AppColors.darkBrown,
                    size: 35,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    scene.name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isActive ? Colors.white : AppColors.darkBrown,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
    return Container(
      height: 53,
      margin: const EdgeInsets.only(bottom: 32),
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
      margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 25),
      decoration: const BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _PowerUsageItem(
            icon: Icons.electrical_services,
            value: 29.5,
            description: 'Power usage today',
          ),
          _PowerUsageItem(
            value: 303,
            icon: Icons.electric_bolt,
            description: 'Power usage this month',
          ),
        ],
      ),
    );
  }
}

class _PowerUsageItem extends StatelessWidget {
  const _PowerUsageItem({
    Key? key,
    required this.icon,
    required this.value,
    required this.description,
  }) : super(key: key);

  final IconData icon;
  final double value;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.darkBrown,
            size: 30,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  text: value.toString(),
                  style: const TextStyle(
                    color: AppColors.darkBrown,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  children: const [
                    TextSpan(
                      text: ' KwH',
                      style: TextStyle(
                        color: AppColors.darkBrown,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
