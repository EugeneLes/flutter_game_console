import 'package:flutter/widgets.dart';

class ScaleUtil {
  static Size getWindowSizeInLogicalPixels() {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;

    return view.physicalSize / view.devicePixelRatio;
  }
}
