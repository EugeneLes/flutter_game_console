import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  MediaQueryData get _mediaQueryData => MediaQuery.of(this);

  Size get screenSize => _mediaQueryData.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  EdgeInsets get screenPadding => _mediaQueryData.padding;

  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  double get pixelRatio => _mediaQueryData.devicePixelRatio;
}

extension AccessibilityExtension on BuildContext {
  bool get isAccessibilityEnabled => MediaQuery.of(this).accessibleNavigation;
}
