import 'package:flutter/material.dart';

import 'package:smartest_home_app_ui/config/config.dart';
import 'package:smartest_home_app_ui/models/models.dart';
import 'package:smartest_home_app_ui/widgets/widgets.dart';

class LightPage extends StatelessWidget {
  const LightPage({
    Key? key,
    required this.device,
  }) : super(key: key);

  final Device device;

  static Route route({required Device device}) {
    return MaterialPageRoute(
      builder: (context) => LightPage(device: device),
      settings: const RouteSettings(name: '/light'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        title: device.deviceType.name,
        height: 0.1 * size.height,
        leadingIcon: Icons.arrow_back,
        leadingOnPressed: () => Navigator.pop(context),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            right: -size.height * 0.15,
            child: Image.network(
              'https://cdn.pixabay.com/photo/2022/07/18/17/44/lamp-7330478_960_720.png',
              //  width: 0.4 * size.width,
              height: size.height * 0.45,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.136 * size.height,
                      width: size.width,
                    ),
                    const _Header(title: 'Power'),
                    const SizedBox(height: 17),
                    _CustomSwitch(turnedOn: device.turnedOn),
                    const SizedBox(height: 65),
                    _LightValue(device: device),
                    const SizedBox(height: 97),
                    const _Header(title: 'Intensity'),
                  ],
                ),
              ),
              const SizedBox(height: 90),
              CustomExpandedContainer(
                color: AppColors.lightGrey,
                child: Column(
                  children: const [
                    CustomHeader(title: 'Schedule'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _CustomSwitch extends StatefulWidget {
  const _CustomSwitch({
    Key? key,
    required this.turnedOn,
  }) : super(key: key);

  final bool turnedOn;

  @override
  State<_CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<_CustomSwitch> {
  late bool _turnedOn;

  @override
  void initState() {
    _turnedOn = widget.turnedOn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        _turnedOn = !_turnedOn;
      }),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: Container(
        width: 78,
        height: 42,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Align(
          alignment: _turnedOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: _turnedOn ? AppColors.orange : Colors.grey[400],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _LightValue extends StatelessWidget {
  const _LightValue({
    Key? key,
    required this.device,
  }) : super(key: key);

  final Device device;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${device.value}${device.deviceType.unit}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Brightness',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
