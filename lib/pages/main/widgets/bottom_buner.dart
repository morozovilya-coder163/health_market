import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_market/theme/my_theme_extension.dart';
import 'package:health_market/theme/theme.dart';
import 'package:health_market/widgets/buttons.dart';

class BottomBuner extends StatelessWidget {
  const BottomBuner({
    required this.isInBag,
    required this.onInBag,
    required this.decrement,
    required this.isShowPrice,
    required this.isLowPrice,
    required this.counter,
    this.oldPrice,
  });

  final bool isInBag;
  final VoidCallback onInBag;
  final VoidCallback decrement;
  final bool isShowPrice;
  final bool isLowPrice;
  final String? oldPrice;
  final int counter;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    if (isInBag) return _ifOnInBag(ext);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isLowPrice && isShowPrice
            ? MyColors.yellow
            : MyColors.backgroundColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (oldPrice != null)
                  Text(
                    oldPrice!,
                    style: ext.t4Minus.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                const SizedBox(width: 10),
                Text(oldPrice!, style: ext.t1),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SmallButton(
              onPressed: onInBag,
              title: 'В корзину',
            ),
          ),
        ],
      ),
    );
  }

  Widget _ifOnInBag(MyThemeExtension ext) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: const BoxDecoration(
        color: MyColors.backgroundColor,
      ),
      child: Row(
        children: [
          _circleButtonMinus(),
          const SizedBox(width: 20),
          Text(
            '$counter',
            style: ext.t1,
          ),
          const SizedBox(width: 20),
          _circleButtonPlus(),
          const SizedBox(width: 16),
          Expanded(
            child: SmallButton(
              onPressed: () {},
              title: 'В корзину',
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButtonPlus() {
    return InkWell(
      onTap: onInBag,
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.0,
            color: MyColors.mainTextColor,
          ),
        ),
        child: const Center(
          child: Icon(
            CupertinoIcons.add,
            size: 14,
          ),
        ),
      ),
    );
  }

  Widget _circleButtonMinus() {
    return InkWell(
      onTap: decrement,
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.0,
            color: MyColors.mainTextColor,
          ),
        ),
        child: const Center(
          child: Icon(
            CupertinoIcons.minus,
            size: 14,
            color: MyColors.mainTextColor,
          ),
        ),
      ),
    );
  }
}
