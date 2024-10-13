import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/everything?q=general&apiKey=4b584b638ef2473caf866e497a1c31e5";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['title'] != null &&
            element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element["url"],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              content: element['content']);

          news.add(articleModel);
        }
      });
    }
  }
}
