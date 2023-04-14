import 'package:flutter/material.dart';
import 'package:health_market/generated/assets.gen.dart';
import 'package:health_market/theme/my_theme_extension.dart';

class LikeWidget extends StatelessWidget {
  const LikeWidget({
    required this.onTap,
    required this.color,
    required this.text,
  });

  final Color color;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.like.svg(
            color: color,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: ext.t2.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class DisLikeWidget extends StatelessWidget {
  const DisLikeWidget({
    required this.onTap,
    required this.color,
    required this.text,
  });

  final Color color;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.dislike.svg(
            color: color,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: ext.t2.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
