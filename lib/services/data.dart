import 'package:news_app/models/category_model.dart';

List <CategoryModel> getCategories() {
  List<CategoryModel> category=[];

  CategoryModel categoryModel = CategoryModel();

  categoryModel.CategoryName = "Business";
  categoryModel.image = "images/business.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.CategoryName = "Entertainment";
  categoryModel.image = "images/entertainment.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.CategoryName = "General";
  categoryModel.image = "images/general.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.CategoryName = "Health";
  categoryModel.image = "images/health.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.CategoryName = "Sports";
  categoryModel.image = "images/sports.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}