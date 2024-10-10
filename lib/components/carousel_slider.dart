import 'package:flutter/material.dart';

class ImageCarouselSlider extends StatelessWidget {
  String image;
  int index;
  String name;

  ImageCarouselSlider({super.key, required this.image, required this.index, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 240,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
        )
      ]),
    );
  }
}
