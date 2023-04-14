import 'package:flutter/material.dart';
import 'package:health_market/theme/my_theme_extension.dart';
import 'package:health_market/theme/theme.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.borderRadius),
        ),
      ),
      child: Center(
        child: Padding(
          padding: AppStyle.edgeInsetsForSmallButton,
          child: Text(
            title,
            style: ext.t4.copyWith(
              color: MyColors.backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}

class SmallButtonBorderSide extends StatelessWidget {
  const SmallButtonBorderSide({
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.borderRadius),
          side: const BorderSide(
            color: MyColors.primaryColor,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: AppStyle.edgeInsetsForSmallButton,
          child: Text(
            title,
            style: ext.t4,
          ),
        ),
      ),
    );
  }
}
