import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/carousel_slider.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/components/smooth_slider.dart';
import 'package:news_app/components/trending_news.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/services/category_data.dart';
import 'package:news_app/services/slider_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  int activeIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "News",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              Text(
                "Flash",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.blue),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          categoryName: categories[index].categoryName,
                          image: categories[index].image,
                        );
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 15.0, left: 15.0, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Breaking News",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.blue),
                      )
                    ],
                  ),
                ),
                CarouselSlider.builder(
                    itemCount: sliders.length,
                    itemBuilder: (context, index, realIndex) {
                      String? image_name = sliders[index].image;
                      String? name = sliders[index].name;
                      return ImageCarouselSlider(
                          image: image_name!, index: index, name: name!);
                    },
                    options: CarouselOptions(
                        height: 240,

                        // viewportFraction: 1,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        })),
                SizedBox(
                  height: 10,
                ),
                SmoothSlider(activeIndex: activeIndex, count: sliders.length),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 15.0, left: 15.0, bottom: 12, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Trending News",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.blue),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: const [
                    TrendingNews(),
                    TrendingNews(),
                    TrendingNews(),
                    TrendingNews(),
                    TrendingNews(),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
