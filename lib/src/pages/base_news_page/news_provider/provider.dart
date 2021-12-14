import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss_provider_project/src/api/news_api.dart';


// ignore: camel_case_types
class News_Provider extends ChangeNotifier {
  List<RssItem>? news;
  bool isLoaded = false;
  bool isError = false;

  final LentaRssApi _newsProvider = LentaLastNewsProvider();

  Future<void> loadNews() async{
  try{
  news = await _newsProvider.getNews();
  isLoaded = true;
  notifyListeners();
  } on RssNewsException {
    isError = true;
    notifyListeners();
  }

  }

  Future<void> reloadNews() async{
    isLoaded = false;
    loadNews();
    notifyListeners();

  }


}
