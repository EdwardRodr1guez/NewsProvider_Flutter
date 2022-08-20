import 'package:flutter/material.dart';
import 'package:newsprovider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS ="https://newsapi.org/v2";
final _APIKEY   ="a2e24fa68bab47f690a933dafa6ee1b2";

class NewsService with ChangeNotifier{

List<Article> headlines =[];

NewsService(){
  this.getTopHeadlines();
}

getTopHeadlines()async{
final url  =  "$_URL_NEWS/top-headlines?country=co&category=business&apiKey=$_APIKEY";
final resp = await http.get(Uri.parse(url)); 

final newResponse = newsResponseFromJson(resp.body);
this.headlines.addAll(newResponse.articles);
notifyListeners();
}

}