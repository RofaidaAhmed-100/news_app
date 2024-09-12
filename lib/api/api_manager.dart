import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/api/api_costant.dart';
class ApiManager{

static Future<SourceResponse?> getSources(String categoryID)async{
  Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.sourceApi,
  {'apiKey':ApiConstant.apiKey,
    'category':categoryID
  });
  var response=await http.get(url);
  try{
    var responseBody=response.body;
    var json=jsonDecode(responseBody);
    return SourceResponse.fromJson(json);
  }catch(e) {
    throw e;
  }
}
static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
  Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.newsApi,{
    'apiKey' : ApiConstant.apiKey,
    'sources': sourceId,
  });
  var response=await http.get(url);
  try{
    var responseBody=response.body;//string
    var json=jsonDecode(responseBody);//json
    return NewsResponse.fromJson(json);
  }catch(e){
    throw e;
  }
}
}