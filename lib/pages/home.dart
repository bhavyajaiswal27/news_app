import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/carousel_slider.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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

int activeIndex = 1;
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
        body: Column(
          children: [
            Container(
              height: 70,
              margin: const EdgeInsets.only(left: 10.0),
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
            const SizedBox(height: 30),
            const Padding(padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text("Breaking News", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View all", style: TextStyle(color: Colors.blue, fontSize: 16),)
              ],
            ),
            
            ),
            CarouselSlider.builder(
              itemCount: siders.length,
              itemBuilder: (context, index, realIndex) {
                final res = siders[index].image;
                final res1 = siders[index].name;
                return buildImage(res!, index, res1!);
            },
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              )),
              Center(child: buildIndicator()),
              const Padding(padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text("Trending News", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View all", style: TextStyle(color: Colors.blue, fontSize: 16),)
              ],
            ),
            
            ),
          ],
        ),
    );
  }
  Widget buildImage(String urlImage, int index, String name) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Stack(
      children: [
        ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(urlImage, fit: BoxFit.cover, width: MediaQuery.of(context).size.width)),
        Container(
          margin: const EdgeInsets.only(top: 170),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(10)),
          child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
        )
    ]),
  );
  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: siders.length,
    effect: SlideEffect(
      dotHeight: 20,
      dotWidth: 20,
      dotColor: Colors.pink),);
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
}