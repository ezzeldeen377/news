import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceResponse.dart';

class NewsPageViewModel extends ChangeNotifier{
  List<Sources>? sourcesList;
  List<Articles>? newsList;
  int? newsNumber;
  String? errorMessageSource;
  String? errorMessageNews;
  int selectedIndex=0;


  Future<void> getSources(String categoryId) async {
    try {
      var response = await ApiManager.getSources(categoryId);

      if(response.status=='error'){
        errorMessageSource=response.message;
      }else{
        sourcesList = response.sources;
      }
    }catch (e){
      errorMessageSource=e.toString();
    }
    notifyListeners();
  }

  Future<void> getNewsBySource(String sourceId) async {
    try {
      var response = await ApiManager.getAllNews(sourceId, 10);
      if(response.status=='error'){
          errorMessageNews=response.message;
      }else{
          newsList=response.articles;
          newsNumber=response.totalResults;
      }
    }catch (e){
      errorMessageNews=e.toString();
    }
    notifyListeners();

  }
  void changeIndex(int newIndex){
    selectedIndex=newIndex;
    notifyListeners();
  }

}