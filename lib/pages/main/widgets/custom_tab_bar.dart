import 'package:flutter/material.dart';
import 'package:health_market/widgets/buttons.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabNames;
  final TabController tabController;
  final VoidCallback callback;

  const CustomTabBar({
    required this.tabNames,
    required this.tabController,
    required this.callback,
  });

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.tabController.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.tabNames.map((name) {
          int index = widget.tabNames.indexOf(name);
          bool isSelected = index == _selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: isSelected
                ? SmallButton(
                    onPressed: () => onPressed(index),
                    title: name,
                  )
                : SmallButtonBorderSide(
                    onPressed: () => onPressed(index),
                    title: name,
                  ),
          );
        }).toList(),
      ),
    );
  }

  void onPressed(int index) {
    setState(() {
      _selectedIndex = index;
      widget.tabController.animateTo(index);
      widget.callback();
    });
  }
}
