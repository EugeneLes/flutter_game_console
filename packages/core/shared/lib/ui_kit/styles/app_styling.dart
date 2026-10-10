import 'package:flutter/material.dart';
import 'package:shared/ui_kit/styles/index.dart';
import 'package:shared/ui_kit/styles/styleguides/index.dart';

/// AppColor is enum representation of colors used across the project.
abstract class AppStyling {
  Color getColor(AppColor appColor);

  TextStyle getTextStyle({
    required AppText appStyle,
    AppColor? appColor,
    double opacity = 1,
    bool allowEmptyColor = false,
  });

  ButtonStyleInfo getButtonStyleInfo();

  FormStyle getFormStyle();

  String getApplicationName();

  bool get isDark;
}
