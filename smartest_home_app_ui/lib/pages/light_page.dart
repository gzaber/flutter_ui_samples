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
              height: size.height * 0.45,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
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
                    const SizedBox(height: 10),
                    _CustomSlider(size: size),
                  ],
                ),
              ),
              const SizedBox(height: 65),
              CustomExpandedContainer(
                color: AppColors.lightGrey,
                child: Column(
                  children: const [
                    CustomHeader(title: 'Schedule', paddingBottom: 0),
                    _Schedule(),
                    CustomExpandedContainer(
                      color: Colors.white,
                      child: _PowerUsage(),
                    ),
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
      style: AppTextStyles.lightHeader,
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
          style: AppTextStyles.lightMeasurementValue,
        ),
        const SizedBox(height: 5),
        const Text(
          'Brightness',
          style: AppTextStyles.lightMeasurementDescription,
        ),
      ],
    );
  }
}

class _CustomSlider extends StatelessWidget {
  const _CustomSlider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.lightbulb_outline,
          color: Colors.white.withOpacity(0.6),
          size: 30,
        ),
        const SizedBox(width: 5),
        Stack(
          children: [
            SizedBox(
              width: size.width - 120,
              height: 35,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          height: 3,
                          color: Colors.white,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: 3,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        6,
                        (index) => Container(
                          width: 2,
                          height: 5,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 55,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [AppBoxShadows.lightCustomSliderThumb],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 5),
        Icon(
          Icons.lightbulb,
          color: Colors.white.withOpacity(0.6),
          size: 30,
        ),
      ],
    );
  }
}

class _Schedule extends StatelessWidget {
  const _Schedule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        children: const [
          _ScheduleHours(
            preposition: 'From',
            hour: '6:00',
            timeOfDay: 'PM',
          ),
          SizedBox(width: 20),
          _ScheduleHours(
            preposition: 'To',
            hour: '11:00',
            timeOfDay: 'PM',
          ),
          Spacer(),
          _CustomIconButton(icon: Icons.delete),
          _CustomIconButton(icon: Icons.edit),
        ],
      ),
    );
  }
}

class _ScheduleHours extends StatelessWidget {
  const _ScheduleHours({
    Key? key,
    required this.preposition,
    required this.hour,
    required this.timeOfDay,
  }) : super(key: key);

  final String preposition;
  final String hour;
  final String timeOfDay;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$preposition    ',
        style: AppTextStyles.lightSchedulePreposition,
        children: [
          TextSpan(
            text: hour,
            style: AppTextStyles.lightScheduleHour,
          ),
          TextSpan(
            text: '  $timeOfDay',
            style: AppTextStyles.lightScheduleTimeOfDay,
          ),
        ],
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () {},
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            icon,
            size: 23,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}

class _PowerUsage extends StatelessWidget {
  const _PowerUsage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: const [
          _StatsRow(
            description: 'Usage today',
            value: '0.5',
            unit: 'kwH',
          ),
          _StatsRow(
            description: 'Usage this month',
            value: '6',
            unit: 'kwH',
          ),
          _StatsRow(
            description: 'Total working hrs',
            value: '125',
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    Key? key,
    required this.description,
    required this.value,
    this.unit,
  }) : super(key: key);

  final String description;
  final String value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            description,
            style: AppTextStyles.lightStatsDescription,
          ),
          RichText(
            text: TextSpan(
              text: value,
              style: AppTextStyles.lightStatsValue,
              children: [
                TextSpan(
                  text: unit != null ? ' $unit' : '',
                  style: AppTextStyles.lightStatsUnit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
