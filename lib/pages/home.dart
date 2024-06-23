import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        body: Container(),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final CategoryName, image;
  const CategoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image(
            image: image,
            width: 120,
            height: 60)
        ],
      ),
    );
  }
}