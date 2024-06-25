import 'package:news_app/models/carousel_slider.dart';

List <SliderModel> getslider() {
  List<SliderModel> slider=[];

  SliderModel categoryModel = SliderModel();
  
  categoryModel.image = "images/business.jpeg";
  categoryModel.name = "ABCDEFx ";
  slider.add(categoryModel);
  categoryModel = new SliderModel();
  categoryModel.image = "images/entertainment.jpeg";
  categoryModel.name = "Entertainment";
  slider.add(categoryModel);
  categoryModel = new SliderModel();
  categoryModel.image = "images/health.jpeg";
  categoryModel.name = "Health";
  slider.add(categoryModel);
  categoryModel = new SliderModel();
  categoryModel.image = "images/science.jpeg";
  categoryModel.name = "Science";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  return slider;
}