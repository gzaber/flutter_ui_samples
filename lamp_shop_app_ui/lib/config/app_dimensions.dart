import 'package:flutter/widgets.dart';

class AppDimensions {
  static const edgeInsets = _AppEdgeInsets();
  static const borderRadius = _AppBorderRadius();

  static const double headerImageHeightRatio = 0.65;
  static const double inkImageHeightRatio = 0.47;
  static const double gridItemAspectRatio = 0.64;
  static const double navBarHeight = 110;
}

class _AppEdgeInsets {
  const _AppEdgeInsets();

  EdgeInsets get header => const EdgeInsets.fromLTRB(10, 10, 10, 0);
  EdgeInsets get gridViewTitle => const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      );
  EdgeInsets get gridView => const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 100,
      );
  EdgeInsets get searchIcon => const EdgeInsets.all(15);
  EdgeInsets get exploreButton => const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      );
}

class _AppBorderRadius {
  const _AppBorderRadius();

  BorderRadius get circular20 => BorderRadius.circular(20);
  BorderRadius get circular30 => BorderRadius.circular(30);
}
