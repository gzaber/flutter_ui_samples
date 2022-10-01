import 'package:flutter/widgets.dart';

class AppDimensions {
  static const edgeInsets = _AppEdgeInsets();
  static const borderRadius = _AppBorderRadius();

  static const double homeHeaderImageRatio = 0.69;
  static const double homeInkImageRatio = 0.48;
  static const double homeGridItemRatio = 0.61;
  static const double homeNavBarHeight = 110;
  static const double homeNavBarIconSize = 25;
  static const double detailsAppBarIconSize = 20;
}

class _AppEdgeInsets {
  const _AppEdgeInsets();

  EdgeInsets get homeHeader => const EdgeInsets.fromLTRB(10, 10, 10, 0);
  EdgeInsets get homeGridViewTitle => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 23,
      );
  EdgeInsets get homeGridView => const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 100,
      );
  EdgeInsets get homeSearchIcon => const EdgeInsets.all(15);
  EdgeInsets get homeExploreButton => const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25,
      );
  EdgeInsets get detailsHeader =>
      const EdgeInsets.only(left: 30, top: 30, right: 20);
  EdgeInsets get detailsColorBar =>
      const EdgeInsets.only(left: 25, top: 28, bottom: 22);
  EdgeInsets get detailsColorBarInner =>
      const EdgeInsets.fromLTRB(20, 17, 20, 17);
  EdgeInsets get detailsHorizontalLine =>
      const EdgeInsets.symmetric(horizontal: 10);
  EdgeInsets get detailsDescription =>
      const EdgeInsets.only(left: 30, right: 20);
}

class _AppBorderRadius {
  const _AppBorderRadius();

  BorderRadius get circular10 => BorderRadius.circular(10);
  BorderRadius get circular15 => BorderRadius.circular(15);
  BorderRadius get circular20 => BorderRadius.circular(20);
  BorderRadius get circular30 => BorderRadius.circular(30);
  BorderRadius get detailsBuyButton => const BorderRadius.only(
        topLeft: Radius.circular(35),
      );
}
