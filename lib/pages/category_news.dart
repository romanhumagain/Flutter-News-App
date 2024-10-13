import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/components/my_category_news_data.dart';
import 'package:news_app/models/article_model.dart';

import '../services/category_news.dart';

class MyCategoryNews extends StatefulWidget {
  final String categoryName;
  const MyCategoryNews({super.key, required this.categoryName});

  @override
  State<MyCategoryNews> createState() => _State();
}

class _State extends State<MyCategoryNews> {
  List<ArticleModel> categoryNews = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    getCategoryWiseNews();
    super.initState();
  }

  getCategoryWiseNews() async {
    CategoryNews catNews = CategoryNews();
    await catNews.getCategoryNews(widget.categoryName.toLowerCase());
    setState(() {
      categoryNews = catNews.categoryNews;
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
              widget.categoryName,
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
                      itemCount: categoryNews.length,
                      itemBuilder: (context, index) {
                        return MyCategoryNewsData(
                          title: categoryNews[index].title!,
                          description: categoryNews[index].description!,
                          imageUrl: categoryNews[index].urlToImage!,
                          url: categoryNews[index].url!,
                        );
                      })),
            ),
    );
  }
}
