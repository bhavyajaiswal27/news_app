import 'dart:convert';

import 'package:news_app/models/artical_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticalModel> news = [];
  Future <void> getNews() async{
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2024-05-26&sortBy=publishedAt&apiKey=3e2b76aaa22b4f4f95e0b0ca4edac460";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"])
      })
    } 
  }
}