import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/models/carousel_slider.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticalModel> article = [];
  bool _isloading = true;

  @override
  void initState() {
    categories = getCategories();
    
    sliders = getslider();
    getNews();
    super.initState();
  }

  getNews() async {
  print("getNews called");
  try {
    News newsClass = News();
    await newsClass.getNews();
    print("News fetched, updating articles list");
    article = newsClass.news;

    // Debug prints
    print("Articles fetched: ${article.length}");
    for (var art in article) {
      print("Title: ${art.title}, Description: ${art.description}");
    }

    setState(() {
      _isloading = false;
    });
  } catch (e, stackTrace) {
    print("Error in getNews: $e");
    print("Stack trace: $stackTrace");
  }
}


  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter "),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              margin: const EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTitle(
                    CategoryName: categories[index].CategoryName!,
                    image: categories[index].image!,
                  );
                },
                itemCount: categories.length,
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Breaking News",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Pacifico",
                    ),
                  ),
                  Text("View all",
                      style: TextStyle(color: Colors.blue, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (sliders.isNotEmpty)
              Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: sliders.length,
                    itemBuilder: (context, index, realIndex) {
                      final res = sliders[index].image;
                      final res1 = sliders[index].name;
                      return buildImage(res!, index, res1!);
                    },
                    options: CarouselOptions(
                      height: 300,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                  ),
                  Center(child: buildIndicator()),
                ],
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending News",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (_isloading)
              const Center(child: CircularProgressIndicator())
            else
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: article.length,
                itemBuilder: (context, index) {
                  return BlogTitle(
                    description: article[index].description!,
                    imageUrl: article[index].urlToImage!,
                    title: article[index].title!,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index, String name) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(urlImage,
                  fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
            ),
            Container(
              margin: const EdgeInsets.only(top: 170),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliders.length,
        effect: const SlideEffect(
          dotHeight: 8,
          dotWidth: 8,
          dotColor: Colors.grey,
          activeDotColor: Colors.pink,
        ),
      );
}

class CategoryTitle extends StatelessWidget {
  final String CategoryName;
  final String image;
  const CategoryTitle(
      {super.key, required this.CategoryName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              height: 70,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 70,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            child: Text(
              CategoryName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class BlogTitle extends StatelessWidget {
  final String imageUrl, title, description;

  const BlogTitle({
    super.key,
    required this.description,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          description,
                          maxLines: 3,
                          style: const TextStyle(
                            color: Colors.black26,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
