import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/slider_model.dart';

class Sliders {
  List<SliderModel> sliders = [];

  Future<void> getSlidersNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=4b584b638ef2473caf866e497a1c31e5";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['title'] != null &&
            element['description'] != null) {
          SliderModel sliderModel = SliderModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element["url"],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              content: element['content']);

          sliders.add(sliderModel);
        }
      });
    }
  }
}
