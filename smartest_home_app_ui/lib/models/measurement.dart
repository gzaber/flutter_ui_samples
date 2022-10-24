import 'package:flutter/material.dart';

enum MeasurementType { temperature, humidity, lighting }

extension MeasurementDetails on MeasurementType {
  String get name {
    switch (this) {
      case MeasurementType.temperature:
        return 'Temperature';
      case MeasurementType.humidity:
        return 'Humidity';
      case MeasurementType.lighting:
        return 'Lighting';
    }
  }

  IconData get icon {
    switch (this) {
      case MeasurementType.temperature:
        return Icons.thermostat;
      case MeasurementType.humidity:
        return Icons.water_drop;
      case MeasurementType.lighting:
        return Icons.lightbulb;
    }
  }

  String get unit {
    switch (this) {
      case MeasurementType.temperature:
        return '°C';
      case MeasurementType.humidity:
        return '%';
      case MeasurementType.lighting:
        return '%';
    }
  }
}

class Measurement {
  const Measurement({
    required this.measurementType,
    required this.value,
  });

  final MeasurementType measurementType;
  final int value;
}
