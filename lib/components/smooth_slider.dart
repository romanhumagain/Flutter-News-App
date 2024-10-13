import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothSlider extends StatelessWidget {
  int activeIndex;
  int count;
  SmoothSlider({super.key, required this.activeIndex, required this.count});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(activeIndex: activeIndex, count: 5, effect:SlideEffect(
      activeDotColor: Colors.blue,
      dotWidth: 12,
      dotHeight: 12,
    ) ,);
  }
}
