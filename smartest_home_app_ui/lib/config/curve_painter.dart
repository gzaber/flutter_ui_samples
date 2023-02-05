import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  CurvePainter({
    required this.width,
    required this.height,
    required List<double> chartData,
  }) : segment = width / ((chartData.length - 1) * 3) {
    data = normalizeData(chartData);
  }

  final double width;
  final double height;
  final double segment;
  late final List<double> data;

  List<double> normalizeData(List<double> data) {
    final normalizedData = <double>[];
    final maxValue =
        data.reduce((value1, value2) => value1 > value2 ? value1 : value2);

    for (var value in data) {
      normalizedData.add(value == 0 ? 0 : value / maxValue);
    }
    return normalizedData;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 3
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(0, height - data[0] * height);

    for (var i = 1; i < data.length; i++) {
      path.cubicTo(
          (3 * (i - 1) + 1) * segment,
          height - data[i - 1] * height,
          (3 * (i - 1) + 2) * segment,
          height - data[i] * height,
          (3 * (i - 1) + 3) * segment,
          height - data[i] * height);
    }
    path.lineTo(width, height - data[data.length - 1] * height);

    canvas.drawPath(path, paint);
  }

// coverage:ignore-start
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  // coverage:ignore-end
}
