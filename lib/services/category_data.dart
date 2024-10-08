import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];

  categories.add(CategoryModel(image: 'assets/images/general.jpg', categoryName: 'General'));
  categories.add(CategoryModel(image: 'assets/images/business.jpg', categoryName: 'Business'));
  categories.add(CategoryModel(image: 'assets/images/sports.jpg', categoryName: 'Sports'));
  categories.add(CategoryModel(image: 'assets/images/health.jpg', categoryName: 'Health'));
  categories.add(CategoryModel(image: 'assets/images/entertainment.jpg', categoryName: 'Entertainment'));

  return categories;
}
