import 'package:flutter/widgets.dart';

class AppDimensions {
  AppDimensions({
    required double ratio,
    required double width,
  })  : _ratio = ratio,
        _width = width;

  final double _ratio;
  final double _width;

  AppEdgeInsets get edgeInsets => AppEdgeInsets(ratio: _ratio);
  AppBorderRadius get borderRadius => AppBorderRadius(ratio: _ratio);

  double scalable(double value) => value * _ratio;

  double get headerImageHeight => 0.65 * _width;
  double get inkImageHeight => 0.47 * _width;
  double get gridItemAspectRatio => 0.64;
  double get navBarHeight => 110 * _ratio;
}

class AppEdgeInsets {
  AppEdgeInsets({required double ratio}) : _ratio = ratio;

  final double _ratio;

  EdgeInsets get header =>
      EdgeInsets.fromLTRB(10 * _ratio, 10 * _ratio, 10 * _ratio, 0);
  EdgeInsets get gridViewTitle => EdgeInsets.symmetric(
        horizontal: 20 * _ratio,
        vertical: 25 * _ratio,
      );
  EdgeInsets get gridView => EdgeInsets.only(
        left: 20 * _ratio,
        right: 20 * _ratio,
        bottom: 100 * _ratio,
      );
  EdgeInsets get searchIcon => EdgeInsets.all(15 * _ratio);
  EdgeInsets get exploreButton => EdgeInsets.symmetric(
        vertical: 20 * _ratio,
        horizontal: 30 * _ratio,
      );
}

class AppBorderRadius {
  AppBorderRadius({required double ratio}) : _ratio = ratio;

  final double _ratio;

  BorderRadius get circular20 => BorderRadius.circular(20 * _ratio);
  BorderRadius get circular30 => BorderRadius.circular(30 * _ratio);
}
