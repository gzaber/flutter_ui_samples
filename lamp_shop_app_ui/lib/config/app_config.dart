import 'package:flutter/widgets.dart';

import 'app_dimensions.dart';
import 'app_text_styles.dart';

class AppConfig {
  static const _defaultPixelRatio = 2.5;
  static late double _devicePixelRatio;
  static late Size _deviceSize;

  static void init({required BuildContext context}) {
    _devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    _deviceSize = MediaQuery.of(context).size;
  }

  static AppTextStyles textStyles = AppTextStyles(
    ratio: _devicePixelRatio / _defaultPixelRatio,
  );

  static AppDimensions dimensions = AppDimensions(
    ratio: _devicePixelRatio / _defaultPixelRatio,
    width: _deviceSize.width,
  );
}
