import 'package:flutter/material.dart';
import 'package:health_market/generated/assets.gen.dart';
import 'package:health_market/theme/my_theme_extension.dart';
import 'package:health_market/theme/theme.dart';

class BunnerConsultation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Container(
            width: mediaQuery.width,
            padding: const EdgeInsets.symmetric(vertical: 17),
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
              borderRadius: BorderRadius.circular(AppStyle.borderRadius),
            ),
            child: Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Онлайн-консультация',
                        style: ext.t2.copyWith(color: MyColors.backgroundColor),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Задать вопрос',
                        style: ext.t4.copyWith(color: MyColors.backgroundColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(bottom: -3, top: -3, left: 10, child: Image.asset(Assets.images.helpCenter.path,),),
      ],
    );
  }
}
