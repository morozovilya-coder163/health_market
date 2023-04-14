import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';

enum FontSizeEnum {
  s(12),
  sl(14),
  m(16),
  ml(17),
  ll(20),
  l(24),
  xl(50);

  const FontSizeEnum(this.size);

  final double size;
}

@immutable
class MyThemeExtension extends ThemeExtension<MyThemeExtension> {
  const MyThemeExtension({
    required this.t1,
    required this.t2,
    required this.t3,
    required this.t4,
    required this.t4Minus,
    required this.t5,
    required this.h1,
  });

  final TextStyle t1;
  final TextStyle t2;
  final TextStyle t3;
  final TextStyle t4;
  final TextStyle t4Minus;
  final TextStyle t5;
  final TextStyle h1;

  @override
  MyThemeExtension copyWith({
    TextStyle? t1,
    TextStyle? t2,
    TextStyle? t3,
    TextStyle? t4,
    TextStyle? t4Minus,
    TextStyle? t5,
    TextStyle? h1,
  }) {
    return MyThemeExtension(
      t1: t1 ?? this.t1,
      t2: t2 ?? this.t3,
      t3: t3 ?? this.t3,
      t4: t4 ?? this.t4,
      t4Minus: t4Minus ?? this.t4Minus,
      t5: t5 ?? this.t5,
      h1: h1 ?? this.h1,
    );
  }

  @override
  MyThemeExtension lerp(ThemeExtension<MyThemeExtension>? other, double t) {
    if (other is! MyThemeExtension) {
      return this;
    }
    return MyThemeExtension(
      t1: TextStyle.lerp(t1, other.t1, t) ?? t3,
      t2: TextStyle.lerp(t2, other.t2, t) ?? t3,
      t3: TextStyle.lerp(t3, other.t3, t) ?? t3,
      t4: TextStyle.lerp(t4, other.t4, t) ?? t3,
      t4Minus: TextStyle.lerp(t4Minus, other.t4Minus, t) ?? t3,
      t5: TextStyle.lerp(t5, other.t5, t) ?? t3,
      h1: TextStyle.lerp(h1, other.h1, t) ?? t3,
    );
  }

  static final myThemeExtension = MyThemeExtension(
    t1: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: MyColors.mainTextColor,
        fontSize: FontSizeEnum.l.size,
        fontWeight: FontWeight.w600,
      ),
    ),
    t2: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: MyColors.mainTextColor,
        fontSize: FontSizeEnum.ml.size,
        fontWeight: FontWeight.w500,
      ),
    ),
    t3: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: MyColors.mainTextColor,
        fontSize: FontSizeEnum.m.size,
        fontWeight: FontWeight.w400,
      ),
    ),
    t4: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: MyColors.mainTextColor,
        fontSize: FontSizeEnum.sl.size,
        fontWeight: FontWeight.w400,
      ),
    ),
    t4Minus: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: MyColors.mainTextColor.withOpacity(0.5),
        fontSize: FontSizeEnum.sl.size,
        fontWeight: FontWeight.w400,
      ),
    ),
    t5: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: MyColors.mainTextColor,
        fontSize: FontSizeEnum.s.size,
        fontWeight: FontWeight.w400,
      ),
    ),
    h1: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: MyColors.mainTextColor,
        fontSize: FontSizeEnum.ll.size,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
