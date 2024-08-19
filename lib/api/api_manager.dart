import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:news_app/api/api_constatnts.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceResponse.dart';
class ApiManager{

  /// https://newsapi.org/v2/top-headlines/sources?apiKey=da915602f5c34af9877bf18349629536
    static Future<SourceResponse> getSources(String categoryId) async {
     Uri url= Uri.https(ApiConstatnts.baseUrl,ApiConstatnts.sourcesApi,
        {
          'apiKey':'da915602f5c34af9877bf18349629536',
          'category':categoryId,
        }
     );
     var  response = await http.get(url);
     try {

       var json = jsonDecode(response.body);
       return SourceResponse.fromJson(json);
     }catch(e){
       rethrow;
     }
   }
    ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=da915602f5c34af9877bf18349629536
   static Future<NewsResponse> getAllNews(String source,int pageNumber) async {
      Uri url = Uri.https(ApiConstatnts.baseUrl,ApiConstatnts.newsApi,
      {
        'apiKey':'da915602f5c34af9877bf18349629536',
        'sources':source,
        'sortBy':'publishedAt',
        'pageSize':'10',
        'page':pageNumber.toString()


      }
      );
     var response=await http.get(url);
     try{
       return NewsResponse.fromJson(jsonDecode(response.body));
     }catch(e){
       rethrow;
     }
   }

   static Future<NewsResponse> getNewsByQuery(String query,int pageNumber) async {
      Uri url=Uri.https(ApiConstatnts.baseUrl,ApiConstatnts.newsApi,
      {
        'apiKey':'da915602f5c34af9877bf18349629536',
        'q':query,
        'sortBy':'publishedAt',
        'pageSize':'10',
        'page':pageNumber.toString()
      }
      );
       var response=await http.get(url);
       try{
         var responseBody= response.body;
         return NewsResponse.fromJson(jsonDecode(responseBody));
       }catch(e){
         rethrow;
       }
   }
}