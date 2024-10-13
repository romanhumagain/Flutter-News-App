import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../components/my_category_news_data.dart';
import '../models/article_model.dart';
import '../models/slider_model.dart';
import '../services/news.dart';
import '../services/slider_data.dart';

class AllNews extends StatefulWidget {
  final String newsType;
  AllNews({super.key, required this.newsType});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> breaking = [];
  List <ArticleModel> trending = [];

  bool _isLoading = true;

  @override
  void initState() {
    if(widget.newsType == "breaking"){
      getSliderNews();
    }
    else{
      getNews();
    }
    super.initState();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    trending = newsClass.news;
    setState(() {
      _isLoading = false;
    });
  }
  getSliderNews() async{
    Sliders slidersNews = Sliders();
    await slidersNews.getSlidersNews();
    breaking = slidersNews.sliders;
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
          children: [
            Text(
              "${widget.newsType[0].toUpperCase()}${widget.newsType.substring(1).toLowerCase()} News",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.blue),
            ),
          ],
        ),
      ),

      body: _isLoading
          ? Center(
        child: LoadingAnimationWidget.inkDrop(
            color: Colors.blue, size: 45.0),
      )
          : Center(
        child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            padding: EdgeInsets.all(10.5),
            height: double.infinity,
            child: ListView.builder(
                itemCount: widget.newsType == "breaking"?breaking.length :trending.length ,
                itemBuilder: (context, index) {
                  return MyCategoryNewsData(
                    title: widget.newsType == "breaking"?breaking[index].title!:trending[index].title!,
                    description: widget.newsType == "breaking"?breaking[index].description!:trending[index].description!,
                    imageUrl: widget.newsType == "breaking"?breaking[index].urlToImage!:trending[index].urlToImage!,
                    url: widget.newsType == "breaking"?breaking[index].url!:trending[index].url!,
                  );
                })),
      ),
    );
  }
}
