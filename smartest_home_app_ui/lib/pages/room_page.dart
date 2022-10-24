import 'package:flutter/material.dart';

import 'package:smartest_home_app_ui/models/models.dart';
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
          Container(
            height: 77,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                ...List.generate(
                  room.measurements.length,
                  (index) => Column(
                    children: [
                      Row(
                        children: [
                          Icon(room.measurements[index].measurementType.icon),
                          Text(
                              '${room.measurements[index].value} ${room.measurements[index].measurementType.unit}')
                        ],
                      ),
                      Text(room.measurements[index].measurementType.name),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
