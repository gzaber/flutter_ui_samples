import 'package:flutter/material.dart';

import 'package:smartest_home_app_ui/config/config.dart';
import 'package:smartest_home_app_ui/models/models.dart';
import 'package:smartest_home_app_ui/pages/pages.dart';
import 'package:smartest_home_app_ui/widgets/widgets.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({
    Key? key,
    required this.room,
  }) : super(key: key);

  final Room room;

  static Route route({required Room room}) {
    return MaterialPageRoute(
      builder: (context) => RoomPage(room: room),
      settings: const RouteSettings(name: '/room'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        title: room.name,
        height: 0.1 * size.height,
        leadingIcon: Icons.arrow_back,
        leadingOnPressed: () => Navigator.pop(context),
        trailingIcon: Icons.token_outlined,
      ),
      body: Column(
        children: [
          _Measurements(room: room),
          const _EnergyUsage(),
          CustomExpandedContainer(
            color: AppColors.lightGrey,
            child: Column(
              children: [
                const CustomHeader(title: 'Devices'),
                _Devices(room: room),
                const _TurnOffButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Measurements extends StatelessWidget {
  const _Measurements({
    Key? key,
    required this.room,
  }) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            room.measurements.length,
            (index) => _MeasurementItem(measurement: room.measurements[index]),
          ),
        ],
      ),
    );
  }
}

class _MeasurementItem extends StatelessWidget {
  const _MeasurementItem({
    Key? key,
    required this.measurement,
  }) : super(key: key);

  final Measurement measurement;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 77,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                measurement.measurementType.icon,
                color: AppColors.darkBrown,
                size: 22,
              ),
              Text(
                measurement.value.toString(),
                style: const TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' ${measurement.measurementType.unit}',
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            measurement.measurementType.name,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _EnergyUsage extends StatelessWidget {
  const _EnergyUsage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      padding: const EdgeInsets.only(top: 30),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Usage today',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.6,
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: '25',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: ' kwH',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          RichText(
            text: const TextSpan(
              text: '7.5',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: ' kwH',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(
                  painter: CurvePainter(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 45,
                    chartData: [4.0, 0.0, 8.5, 2.0, 5.0, 10],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 160,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 18,
                  left: 164,
                  child: Container(
                    width: 1,
                    height: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                6,
                (index) => Text(
                  '${index + 1} pm',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                ),
              ),
              const Text(''),
            ],
          ),
        ],
      ),
    );
  }
}

class _Devices extends StatelessWidget {
  const _Devices({
    Key? key,
    required this.room,
  }) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        shrinkWrap: true,
        childAspectRatio: 1.28,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          ...room.devices.map(
            (device) => _DeviceItem(device: device),
          ),
        ],
      ),
    );
  }
}

class _DeviceItem extends StatefulWidget {
  const _DeviceItem({
    Key? key,
    required this.device,
  }) : super(key: key);

  final Device device;

  @override
  State<_DeviceItem> createState() => _DeviceItemState();
}

class _DeviceItemState extends State<_DeviceItem> {
  late bool isHighlight;

  @override
  void initState() {
    isHighlight = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          if (widget.device.deviceType == DeviceType.light) {
            Navigator.push(context, LightPage.route(device: widget.device));
          }
        },
        highlightColor: AppColors.orange,
        onHighlightChanged: (value) {
          setState(() {
            isHighlight = value;
          });
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    widget.device.deviceType.icon,
                    color: isHighlight ? Colors.white : AppColors.darkBrown,
                    size: 30,
                  ),
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: widget.device.turnedOn
                        ? AppColors.orange
                        : Colors.grey[400],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.device.deviceType.name,
                    style: TextStyle(
                      color: isHighlight ? Colors.white : AppColors.darkBrown,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.device.value != null
                        ? '${widget.device.value}${widget.device.deviceType.unit}'
                        : widget.device.turnedOn
                            ? 'On'
                            : 'Off',
                    style: TextStyle(
                      color: isHighlight ? Colors.white : AppColors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TurnOffButton extends StatelessWidget {
  const _TurnOffButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.brownButton,
            spreadRadius: -8,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: AppColors.brownButton,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: const Center(
            child: Text(
              'Turn off all devices',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
