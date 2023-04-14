import 'package:flutter/material.dart';

import '../../interfaces/interface_pages.dart';
import '../../theme/my_theme_extension.dart';

class DiscountsPage extends StatelessWidget implements InterfacesPages {
  const DiscountsPage();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<MyThemeExtension>()!;

    return Center(
      child: Text(
        'В разработке',
        style: ext.t3,
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
}
