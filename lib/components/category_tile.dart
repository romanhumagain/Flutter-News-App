import 'package:flutter/material.dart';
import 'package:news_app/pages/category_news.dart';

class CategoryTile extends StatelessWidget {
  final image;
  final categoryName;

  const CategoryTile({super.key, required this.image, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCategoryNews(categoryName: categoryName)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 140,
                )),
            Container(
              height: 100,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black38,
              ),
              child: Center(
                  child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
            )
          ],
        ),
      ),
    );
  }
}
