import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/category_tile.dart';
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
                "App",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.blue),
              )
            ],
          ),
        ),
        body: Container(
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
              CarouselSlider.builder(
                  itemCount: sliders.length,
                  itemBuilder: (context, index, realIndex) {
                    String? image_name = sliders[index].image;
                    String? name = sliders[index].name;

                    return buildImage(image_name!, index, name!);
                  },
                  options: CarouselOptions(
                      height: 200,

                      // viewportFraction: 1,
                      enlargeCenterPage: true,
                      autoPlay: true))
            ],
          ),
        ));
  }

  Widget buildImage(String image, int index, String name) => Container(
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          )
        ]),
      );
}
