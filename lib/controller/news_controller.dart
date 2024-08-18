import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:news_app_dummy_api/config/helper.dart';
import 'package:news_app_dummy_api/model/news_model.dart';
class NewsController extends GetxController{
RxList<NewsModel> trendingNewsList=<NewsModel>[].obs;
RxList<NewsModel> forYouNewsList=<NewsModel>[].obs;
RxList<NewsModel> forYouNewsListFive=<NewsModel>[].obs;
RxList<NewsModel> appleNewsList=<NewsModel>[].obs;
RxList<NewsModel> appleFiveNewsList=<NewsModel>[].obs;
RxList<NewsModel> teslaNewsList=<NewsModel>[].obs;
RxList<NewsModel> teslaFiveNewsList=<NewsModel>[].obs;
RxList<NewsModel> businessNewsList=<NewsModel>[].obs;
RxList<NewsModel> businessFiveNewsList=<NewsModel>[].obs;
RxList<NewsModel> techCrunchNewsList=<NewsModel>[].obs;
RxList<NewsModel> techCrunchFiveNewsList=<NewsModel>[].obs;

RxBool isTrendingNewsLoading=true.obs;
RxBool isForYouNewsLoading=true.obs;
RxBool isAppleNewsLoading=true.obs;
RxBool isTeslaNewsLoading=true.obs;
RxBool isBusinessNewsLoading=true.obs;
RxBool isTechCrunchNewsLoading=true.obs;




@override
void onInit() {
  getTrendingNews();
  getForYouNews();
  getTeslaNews();
  getAppleNews();
  getBusinessNews();
  getTechCrunchNews();
  super.onInit();
}


  Future<void> getTrendingNews()async{
    try{
      isTrendingNewsLoading.value=true;
      var baseUrl="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5e43308aa29444d5802a838943259116";
      var response=await http.get(Uri.parse(baseUrl));
      kPrint(response);
      if(response.statusCode==200){
        var jsonBody=jsonDecode(response.body);
        var article=jsonBody['articles'];
        for(var news in article){
          trendingNewsList.add(NewsModel.fromJson(news));
        }
      }else{
        kPrint("Something went wrong in Trending news");
      }
    }catch(e){
      kPrint(e.toString());
      throw e.toString();
    }finally{
      isTrendingNewsLoading.value=false;
    }
  }

  Future<void> getForYouNews()async{
    try{
      isForYouNewsLoading.value=true;
      var baseUrl="https://newsapi.org/v2/everything?domains=wsj.com&apiKey=5e43308aa29444d5802a838943259116";
      var response=await http.get(Uri.parse(baseUrl));
      kPrint(response);
      if(response.statusCode==200){
        var jsonBody=jsonDecode(response.body);
        var article=jsonBody['articles'];
        for(var news in article){
          forYouNewsList.add(NewsModel.fromJson(news));
        }
        forYouNewsListFive.value=forYouNewsList.sublist(0,5);
      }else{
        kPrint("Something went wrong in for you news list");
      }
    }catch(e){
      kPrint(e.toString());
      throw e.toString();
    }finally{
      isForYouNewsLoading.value=false;
    }
  }

  Future<void> getAppleNews()async{
  try{
    isAppleNewsLoading.value=true;
    var baseUrl="https://newsapi.org/v2/everything?q=apple&from=2024-08-17&to=2024-08-17&sortBy=popularity&apiKey=5e43308aa29444d5802a838943259116";
    var response=await http.get(Uri.parse(baseUrl));
    kPrint(response);
    if(response.statusCode==200){
      var jsonBody=jsonDecode(response.body);
      var article=jsonBody['articles'];
      for(var news in article){
        appleNewsList.add(NewsModel.fromJson(news));
      }
      appleFiveNewsList.value=appleNewsList.sublist(0,5);
    }else{
      kPrint("Something went wrong in for you news list");
    }
  }catch(e){
    kPrint(e.toString());
    throw e.toString();
  }finally{
    isAppleNewsLoading.value=false;
  }
}

  Future<void> getTeslaNews()async{
    try{
      isTeslaNewsLoading.value=true;
      var baseUrl="https://newsapi.org/v2/everything?q=tesla&from=2024-07-18&sortBy=publishedAt&apiKey=5e43308aa29444d5802a838943259116";
      var response=await http.get(Uri.parse(baseUrl));
      kPrint(response);
      if(response.statusCode==200){
        var jsonBody=jsonDecode(response.body);
        var article=jsonBody['articles'];
        for(var news in article){
          teslaNewsList.add(NewsModel.fromJson(news));
        }
        teslaFiveNewsList.value=teslaNewsList.sublist(0,5);
      }else{
        kPrint("Something went wrong in for you news list");
      }
    }catch(e){
      kPrint(e.toString());
      throw e.toString();
    }finally{
      isTeslaNewsLoading.value=false;
    }
  }

Future<void> getBusinessNews()async{
  try{
    isBusinessNewsLoading.value=true;
    var baseUrl="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5e43308aa29444d5802a838943259116";
    var response=await http.get(Uri.parse(baseUrl));
    kPrint(response);
    if(response.statusCode==200){
      var jsonBody=jsonDecode(response.body);
      var article=jsonBody['articles'];
      for(var news in article){
        businessNewsList.add(NewsModel.fromJson(news));
      }
      businessFiveNewsList.value=businessNewsList.sublist(0,5);
    }else{
      kPrint("Something went wrong in for you news list");
    }
  }catch(e){
    kPrint(e.toString());
    throw e.toString();
  }finally{
    isBusinessNewsLoading.value=false;
  }
}

Future<void> getTechCrunchNews()async{
  try{
    isTechCrunchNewsLoading.value=true;
    var baseUrl="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5e43308aa29444d5802a838943259116";
    var response=await http.get(Uri.parse(baseUrl));
    kPrint(response);
    if(response.statusCode==200){
      var jsonBody=jsonDecode(response.body);
      var article=jsonBody['articles'];
      for(var news in article){
        techCrunchNewsList.add(NewsModel.fromJson(news));
      }
      techCrunchFiveNewsList.value=techCrunchNewsList.sublist(0,5);
    }else{
      kPrint("Something went wrong in for you news list");
    }
  }catch(e){
    kPrint(e.toString());
    throw e.toString();
  }finally{
    isTechCrunchNewsLoading.value=false;
  }
}



}