import 'package:flutter/material.dart';
import 'package:health_market/theme/my_theme_extension.dart';
import 'package:health_market/theme/theme.dart';

class Bunner extends StatelessWidget {
  const Bunner({
    required this.color,
    required this.title,
    required this.edgeInsets,
  });

  final Color color;
  final String title;
  final EdgeInsets edgeInsets;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Container(
      padding: edgeInsets,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyle.borderRadius),
        color: color,
      ),
      child: Center(
        child: Text(
          title,
          style: ext.t5,
        ),
      ),
    );
  }
}
