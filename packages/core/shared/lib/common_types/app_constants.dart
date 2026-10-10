import 'package:flutter/services.dart';

class AppConstants {
  static const ui = _Ui._();

  static const rotatingOrientations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  static const landscapeOnlyOrientations = [
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  static const portraitOnlyOrientations = [DeviceOrientation.portraitUp];

  const AppConstants._();
}

class _Ui {
  final topBarHeightS = 48.0;
  final topBarHeightL = 85.0;
  final primaryBarHeight = 52.0;
  final topAppTabHeight = 44.0;
  final webPrimaryBarWidth = 100;
  final selectionBorderWidth = 6.0;

  const _Ui._();
}
