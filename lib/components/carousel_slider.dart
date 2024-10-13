import 'package:flutter/material.dart';
import 'package:news_app/pages/article_view.dart';

class ImageCarouselSlider extends StatelessWidget {
  String imageUrl;
  String title;
  String articleUrl;

  ImageCarouselSlider({super.key, required this.imageUrl, required this.title, required this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(articleUrl: articleUrl,)));
      },
      child: Container(
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
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
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                maxLines: 2,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
