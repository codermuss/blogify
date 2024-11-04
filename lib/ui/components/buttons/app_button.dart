import 'package:blogify/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../styles/paddings.dart';
import '../../styles/text_styles.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const AppButton._({
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  factory AppButton.primary({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) =>
      AppButton._(
        label: label,
        onPressed: onPressed,
        backgroundColor: context.palette.greenPrimary,
        textColor: context.palette.white,
      );

  factory AppButton.secondary({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) =>
      AppButton._(
        label: label,
        onPressed: onPressed,
        backgroundColor: context.palette.gray01,
        textColor: context.palette.greenPrimary,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          textStyle: AppTextStyles.bodyText2,
          padding: Paddings.p16h + Paddings.p16a,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
