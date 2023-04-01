import 'package:flutter/material.dart';

class SlideComponent extends StatefulWidget {
  const SlideComponent({
    Key? key,
    required this.child,
    required this.fromDirection,
    this.isFading = false,
    this.duration = const Duration(seconds: 1),
    this.beginInterval = 0.0,
    this.offsetRatio = 2.0,
  }) : super(key: key);

  final Widget child;
  final AxisDirection fromDirection;
  final bool isFading;
  final Duration duration;
  final double beginInterval;
  final double offsetRatio;

  @override
  State<SlideComponent> createState() => SlideComponentState();
}

class SlideComponentState extends State<SlideComponent>
    with SingleTickerProviderStateMixin {
  late final Offset _offset;
  late final Interval _interval;
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  ); //..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: _offset,
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: _interval));
  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _controller,
    curve: _interval,
  );

  @override
  void initState() {
    super.initState();
    _interval = Interval(widget.beginInterval, 1.0, curve: Curves.easeOut);
    switch (widget.fromDirection) {
      case AxisDirection.up:
        _offset = Offset(0, -widget.offsetRatio);
        break;
      case AxisDirection.right:
        _offset = Offset(widget.offsetRatio, 0);
        break;
      case AxisDirection.down:
        _offset = Offset(0, widget.offsetRatio);
        break;
      case AxisDirection.left:
        _offset = Offset(-widget.offsetRatio, 0);
        break;
    }
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant SlideComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.isFading
          ? FadeTransition(
              opacity: _fadeAnimation,
              child: widget.child,
            )
          : widget.child,
    );
  }
}
