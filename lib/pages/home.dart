import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/carousel_slider.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/slider_data.dart';
// import 'package:news_app/sli';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List <CategoryModel> categories = [];
  List <SliderModel> siders = [];
  @override
  void initState() {
    categories = getCategories();
    siders = getslider();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Flutter "),
            Text("News", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        elevation: 0.3,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 70,
                margin: EdgeInsets.only(left: 10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return CategoryTitle(
                    CategoryName: categories[index].CategoryName,
                    image: categories[index].image,
                  );
                },
                itemCount: categories.length
                ),
              ),
              CarouselSlider.builder(itemCount: itemCount, itemBuilder: itemBuilder, options: options)
            ],
          ),
        ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final CategoryName, image;
  const CategoryTitle({super.key, this.CategoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              height: 70,
              width: 60,
              fit: BoxFit.cover
            )
          ),
          Container(
            width: 120,
            height: 70,
            color: Colors.black,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: Text(
              CategoryName,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
  Widget buildImage(String urlImage, int index, String name) => Container(
    child: Image.asset(name),
  );
}