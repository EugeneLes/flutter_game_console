import 'package:flutter/material.dart';
import 'package:shared/ui_kit/styles/index.dart';

class LoadingOverlay extends StatelessWidget {
  final String? message;
  final bool withBackground;
  final Color? customBackgroundColor;

  const LoadingOverlay({
    super.key,
    this.message,
    this.withBackground = false,
    this.customBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: message,
      textField: false,
      excludeSemantics: true,
      child: Container(
        color: _getContainerColor(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: Colors.white),
              const SizedBox(height: 16),
              if (message != null) Text(message!),
            ],
          ),
        ),
      ),
    );
  }

  Color _getContainerColor(BuildContext context) => withBackground
      ? customBackgroundColor ?? context.styling.getColor(AppColor.neutralDarkGray1)
      : Colors.transparent;
}
