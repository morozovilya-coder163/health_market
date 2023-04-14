import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health_market/theme/my_theme_extension.dart';

class TextBlocWidget extends StatelessWidget {
  const TextBlocWidget({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title:',
            style: ext.t3.copyWith(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: body,
            style: ext.t3,
          ),
        ],
      ),
    );
  }
}
