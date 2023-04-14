import 'package:flutter/material.dart';
import 'package:health_market/generated/assets.gen.dart';
import 'package:health_market/pages/basket/basket.dart';
import 'package:health_market/pages/catalog/catalog_page.dart';
import 'package:health_market/pages/discounts/discounts_page.dart';
import 'package:health_market/pages/main/main_widget.dart';
import 'package:health_market/pages/profile/profile_page.dart';
import 'package:health_market/theme/my_theme_extension.dart';
import 'package:health_market/theme/theme.dart';

import '../../interfaces/interface_pages.dart';

const List<InterfacesPages> pages = [
  MainWidget(),
  DiscountsPage(),
  BasketPage(),
  CatalogPage(),
  ProfilePage(),
];

class MainScreen extends StatefulWidget {
  const MainScreen();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Scaffold(
      appBar: pages[index].appBar(context),
      body: IndexedStack(
        index: index,
        children: pages.map((e) => e as Widget).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.logo.svg(),
            activeIcon: Assets.icons.logo.svg(
              color: MyColors.primaryColor,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.percent.svg(),
            activeIcon: Assets.icons.percent.svg(
              color: MyColors.primaryColor,
            ),
            label: 'Скидки',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.bag.svg(),
            activeIcon: Assets.icons.bag.svg(
              color: MyColors.primaryColor,
            ),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.catalog.svg(),
            activeIcon: Assets.icons.catalog.svg(
              color: MyColors.primaryColor,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.profile.svg(),
            activeIcon: Assets.icons.profile.svg(
              color: MyColors.primaryColor,
            ),
            label: 'Профиль',
          ),
        ],
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}
