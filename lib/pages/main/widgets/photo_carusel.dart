import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:health_market/generated/assets.gen.dart';
import 'package:health_market/theme/theme.dart';

class PhotoCarusel extends StatefulWidget {
  const PhotoCarusel({
    required this.images,
    required this.aspectRatio,
  });

  final List<String> images;
  final double aspectRatio;

  @override
  State<PhotoCarusel> createState() => _PhotoCaruselState();
}

class _PhotoCaruselState extends State<PhotoCarusel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: widget.aspectRatio,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: widget.images.map((i) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Assets.images.image.image(),
          );
        }).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.images.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == entry.key
                    ? const Color(0xFF176967)
                    : MyColors.mainTextColor.withOpacity(0.1),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

class WidgetsCarusel extends StatefulWidget {
  const WidgetsCarusel({
    required this.widgets,
  });

  final List<Widget> widgets;

  @override
  State<WidgetsCarusel> createState() => _WidgetsCaruselState();
}

class _WidgetsCaruselState extends State<WidgetsCarusel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          // enlargeCenterPage: true,
          viewportFraction: 1,
          height: 350,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: widget.widgets.map((i) {
          return i;
        }).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.widgets.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == entry.key
                    ? const Color(0xFF176967)
                    : MyColors.mainTextColor.withOpacity(0.1),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
