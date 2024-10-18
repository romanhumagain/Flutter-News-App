import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/components/carousel_slider.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/components/smooth_slider.dart';
import 'package:news_app/components/trending_news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/pages/all_news.dart';
import 'package:news_app/services/category_data.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/services/slider_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List <ArticleModel> articles = [];

  int activeIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    categories = getCategories();
    getNews();
    getSliderNews();
    super.initState();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();

    articles = newsClass.news;
    setState(() {
      _isLoading = false;
    });
  }

  getSliderNews() async{
    Sliders slidersNews = Sliders();
    await slidersNews.getSlidersNews();
    sliders = slidersNews.sliders;
    setState(() {
      _isLoading = false;
    });
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
        body:_isLoading ? 
        Center(child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.blue, size: 65.0)):
        SingleChildScrollView(
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
                    children: [
                      Text(
                        "Breaking News",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AllNews(newsType: "breaking",)));
                        },
                        child: Text(
                          "View all",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.blue,
                          decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                              decorationThickness: 1
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      String? imageUrl = sliders[index].urlToImage;
                      String? title = sliders[index].title;
                      String ? articleUrl = sliders[index].url;
                      return ImageCarouselSlider(
                          imageUrl: imageUrl!, title: title!, articleUrl: articleUrl!);
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
                    children: [
                      Text(
                        "Trending News",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AllNews(newsType: "trending",)));
                        },
                        child: Text(
                          "View all",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              decorationThickness: 1
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index){
                        return TrendingNews(imageUrl: articles[index].urlToImage!, title: articles[index].title!, description: articles[index].description!, url: articles[index].url!,);
                      }),
                )
              ],
            ),
          ),
        )
    );
  }
}
