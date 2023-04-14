import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_theme_extension.dart';

final themeData = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: MyColors.primaryColor,
    secondary: MyColors.primaryColor,
  ),
  textTheme: GoogleFonts.firaSansExtraCondensedTextTheme(),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: MyColors.mainTextColor,
      textStyle: GoogleFonts.fredokaOne(),
    ),
  ),
  scaffoldBackgroundColor: MyColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: MyColors.backgroundColor,
  ),
  tabBarTheme: TabBarTheme(
    labelPadding: AppStyle.edgeInsetsForMediumButton,
    labelColor: MyColors.primaryColor,
    labelStyle: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: MyColors.backgroundColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    unselectedLabelColor: MyColors.mainTextColor,
    unselectedLabelStyle: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: MyColors.mainTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: MyColors.mainTextColor,
    selectedItemColor: MyColors.primaryColor,
    selectedLabelStyle: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: MyColors.primaryColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
    unselectedLabelStyle: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: MyColors.mainTextColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    MyThemeExtension.myThemeExtension,
  ],
);

abstract class MyColors {
  static const backgroundColor = Color(0xFFFFFFFF);
  static const primaryColor = Color(0xFF176967);
  static const yellow = Color(0xFFFFD44D);
  static const mainTextColor = Color(0xFF303030);
  static const bunnerLightBlueColor = Color(0xFFF2FBFB);
}

abstract class AppStyle {
  static const padding = 16.0;
  static const edgeInsets = EdgeInsets.all(padding);
  static const edgeInsetsForSmallButton =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const edgeInsetsForMediumButton =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const borderRadius = 20.0;
}

class MySpacing extends StatelessWidget {
  const MySpacing();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 16, height: 16);
  }
}
