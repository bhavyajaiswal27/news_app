import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 3,
              child: Image.asset("images/business.dart",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.7,
              fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(height: 20),
          const Text("News from the\n world for you",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          )),
          const Text("Take some time and rrsad ",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500
          ),),
          const SizedBox(height: 40,),
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 5.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      
                    ),
                  )
                ),
              ),
            ),
          )

        ]),
      )
    );
  }
}