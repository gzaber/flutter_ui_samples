import 'package:flutter/material.dart';

enum DeviceType { light, ac, wifi, smartTV }

extension DeviceDetails on DeviceType {
  String get name {
    switch (this) {
      case DeviceType.light:
        return 'Light';
      case DeviceType.ac:
        return 'AC';
      case DeviceType.wifi:
        return 'Wi-Fi';
      case DeviceType.smartTV:
        return 'Smart TV';
    }
  }

  IconData get icon {
    switch (this) {
      case DeviceType.light:
        return Icons.light;
      case DeviceType.ac:
        return Icons.ac_unit;
      case DeviceType.wifi:
        return Icons.wifi;
      case DeviceType.smartTV:
        return Icons.tv;
    }
  }

  String? get unit {
    switch (this) {
      case DeviceType.light:
        return '%';
      case DeviceType.ac:
        return '°C';
      default:
        return null;
    }
  }
}

class Device {
  Device({
    required this.deviceType,
    this.turnedOn = false,
    this.value,
  });

  final DeviceType deviceType;
  final bool turnedOn;
  final int? value;
}
