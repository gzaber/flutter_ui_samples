import 'package:flutter/material.dart';

import '../config/config.dart';

class HorizontalLine extends StatefulWidget {
  const HorizontalLine({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  State<HorizontalLine> createState() => _HorizontalLineState();
}

class _HorizontalLineState extends State<HorizontalLine> {
  double width = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      setState(() {
        width = MediaQuery.of(context).size.width - 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        width: width,
        height: widget.color == AppColors.white ? 1 : 1.2,
        color: widget.color,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
