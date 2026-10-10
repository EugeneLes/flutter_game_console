import 'package:shared/ui_kit/index.dart';

class ButtonStyleInfo {
  static const maxRadius = 2147483647.0; // int32 max value

  final double borderRadius;
  final AppColor innerTextColor;
  final AppColor outerTextColor;

  const ButtonStyleInfo({
    required this.borderRadius,
    required this.innerTextColor,
    required this.outerTextColor,
  });
}
