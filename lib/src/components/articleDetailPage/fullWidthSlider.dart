import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../theme/theme.dart';

class FullWidthSlider extends StatefulWidget {
  final List<String> images;

  FullWidthSlider({required this.images});

  @override
  _FullWidthSliderState createState() => _FullWidthSliderState();
}

class _FullWidthSliderState extends State<FullWidthSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 500,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              onPageChanged: (index, _) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.images.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ));
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? AppTheme.themeData.primaryColor
                    : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
