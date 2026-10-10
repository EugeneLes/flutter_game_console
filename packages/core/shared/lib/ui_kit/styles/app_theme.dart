import 'package:flutter/material.dart';
import 'package:shared/ui_kit/styles/index.dart';

extension AppStylingContext on BuildContext {
  AppStyling get styling => dependOnInheritedWidgetOfExactType<AppTheme>()!.styling;
}

class AppTheme extends InheritedWidget {
  final AppStyling styling;

  const AppTheme(this.styling, {required super.child, super.key});

  @override
  bool updateShouldNotify(AppTheme oldWidget) => styling != oldWidget.styling;
}
