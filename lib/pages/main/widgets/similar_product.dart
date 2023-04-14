import 'package:flutter/material.dart';
import 'package:health_market/generated/assets.gen.dart';
import 'package:health_market/theme/my_theme_extension.dart';
import 'package:health_market/theme/theme.dart';
import 'package:health_market/widgets/bunners.dart';
import 'package:health_market/widgets/buttons.dart';

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({
    required this.image,
    required this.text,
    required this.oldPrice,
    required this.currentPrice,
    required this.discount,
  });

  final String image;
  final String text;
  final String oldPrice;
  final String currentPrice;
  final String discount;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyle.borderRadius),
        color: MyColors.backgroundColor,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                text,
                style: ext.t4,
              ),
              const SizedBox(height: 16),
              _priceWidget(ext),
              const SizedBox(height: 16),
              SmallButton(
                onPressed: () {},
                title: 'В корзину',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.topCenter, child: _row()),
          ),
        ],
      ),
    );
  }

  Widget _row() {
    return SizedBox(
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Bunner(
            color: MyColors.yellow,
            edgeInsets: AppStyle.edgeInsetsForSmallButton,
            title: 'Скидка',
          ),
          Assets.icons.like.svg(),
        ],
      ),
    );
  }

  Widget _priceWidget(MyThemeExtension ext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$oldPrice₽',
              style: ext.t4Minus.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 24),
            Bunner(
              color: MyColors.bunnerLightBlueColor,
              title: '-$discount%',
              edgeInsets: AppStyle.edgeInsetsForSmallButton,
            )
          ],
        ),
        const SizedBox(width: 7),
        Text(
          '$currentPrice₽',
          style: ext.t1,
        ),
      ],
    );
  }
}
