import 'package:smartest_home_app_ui/models/models.dart';

class Room {
  const Room({
    required this.name,
    required this.imageUrl,
    required this.devices,
  });

  final String name;
  final String imageUrl;
  final List<Device> devices;

  static List<Room> rooms = [
    Room(
      name: 'Living Room',
      imageUrl:
          'https://cdn.pixabay.com/photo/2013/07/12/13/58/couch-147685_960_720.png',
      devices: [
        Device(
          deviceType: DeviceType.lamp,
          turnedOn: true,
          value: 80,
        ),
        Device(
          deviceType: DeviceType.ac,
          turnedOn: true,
          value: 23,
        ),
        Device(
          deviceType: DeviceType.wifi,
          turnedOn: true,
        ),
        Device(
          deviceType: DeviceType.smartTV,
        ),
      ],
    ),
    Room(
      name: 'Bedroom',
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/01/31/19/24/bed-3967757_960_720.png',
      devices: [
        Device(
          deviceType: DeviceType.lamp,
          turnedOn: true,
          value: 65,
        ),
        Device(
          deviceType: DeviceType.ac,
          turnedOn: true,
          value: 21,
        ),
        Device(
          deviceType: DeviceType.wifi,
          turnedOn: true,
        ),
      ],
    ),
    Room(
      name: 'Kitchen',
      imageUrl:
          'https://cdn.pixabay.com/photo/2013/07/13/12/15/cooking-pot-159470_960_720.png',
      devices: [
        Device(
          deviceType: DeviceType.lamp,
          turnedOn: true,
          value: 70,
        ),
        Device(
          deviceType: DeviceType.ac,
          turnedOn: true,
          value: 22,
        ),
      ],
    ),
    Room(
      name: 'Bathroom',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/05/16/03/50/bathtub-3404827_960_720.png',
      devices: [
        Device(
          deviceType: DeviceType.lamp,
        ),
      ],
    ),
  ];
}
