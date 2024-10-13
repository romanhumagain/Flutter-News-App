import 'package:flutter/material.dart';
import 'package:news_app/pages/article_view.dart';

class MyCategoryNewsData extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String url;


  MyCategoryNewsData(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(articleUrl:url)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.5),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width/1.1,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),
              maxLines: 3,
            ),
            Text(description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black54
            ),
            maxLines: 4,)
          ],
        ),
      ),
    );
  }
}
