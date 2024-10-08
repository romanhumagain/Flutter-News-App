import 'package:flutter/material.dart';
import 'package:news_app/components/category_tile.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/category_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List <CategoryModel> categories =[];
  @override
  void initState() {
    categories = getCategories();
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
            Text("News", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
            Text("App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.blue),)
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
                  itemBuilder: (context, index){
                return CategoryTile(categoryName: categories[index].categoryName, image: categories[index].image,);
              }),
            ),
          ],
        ),
      )
    );
  }
}
