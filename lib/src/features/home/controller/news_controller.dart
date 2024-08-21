import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/core/helpers/helper.dart';
import 'package:news_app_dummy_api/src/core/network/api_endpoints.dart';
import 'package:news_app_dummy_api/src/core/network/api_handler.dart';
import 'package:news_app_dummy_api/src/features/home/model/news_model.dart';
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
RxBool isSpeaking=false.obs;

FlutterTts flutterTts = FlutterTts();




@override
void onInit() {
 getTrendingNews();
 getForYouNews();
 getAppleNews();
 getTeslaNews();
 getBusinessNews();
 getTechCrunchNews();
 setUpCompletionHandler();
  super.onInit();
}


Future<void> getTrendingNews()async{
  try{
    isTrendingNewsLoading.value=true;
    var response=await ApiHandler.handleResponse(await ApiHandler.getRequest(api: ApiEndpoints.trendingNewsApi));
    if(response !=null){
      trendingNewsList.value=[];
      for(var trendingNews in response['articles']){
        trendingNewsList.add(NewsModel.fromJson(trendingNews));
      }
    }else {
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
    var response=await ApiHandler.handleResponse(await ApiHandler.getRequest(api: ApiEndpoints.newsForYouApi));
    if(response !=null){
      forYouNewsList.value=[];
      for(var news in response['articles']){
        forYouNewsList.add(NewsModel.fromJson(news));
      }
      forYouNewsListFive.value=forYouNewsList.sublist(0,5);
    }else {
      kPrint("Something went wrong in Trending news");
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
    var response=await ApiHandler.handleResponse(await ApiHandler.getRequest(api: ApiEndpoints.appleNewsApi));
    if(response !=null){
      appleNewsList.value=[];
      for(var news in response['articles']){
        appleNewsList.add(NewsModel.fromJson(news));
      }
      appleFiveNewsList.value=appleNewsList.sublist(0,5);
    }else {
      kPrint("Something went wrong in Trending news");
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
    var response=await ApiHandler.handleResponse(await ApiHandler.getRequest(api: ApiEndpoints.teslaNewsApi));
    if(response !=null){
      teslaNewsList.value=[];
      for(var news in response['articles']){
        teslaNewsList.add(NewsModel.fromJson(news));
      }
      teslaFiveNewsList.value=teslaNewsList.sublist(0,5);
    }else {
      kPrint("Something went wrong in tesla news");
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
    var response=await ApiHandler.handleResponse(await ApiHandler.getRequest(api: ApiEndpoints.businessNewsApi));
    if(response !=null){
      businessNewsList.value=[];
      for(var news in response['articles']){
        businessNewsList.add(NewsModel.fromJson(news));
      }
      businessFiveNewsList.value=businessNewsList.sublist(0,5);
    }else {
      kPrint("Something went wrong in business news list");
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
    var response=await ApiHandler.handleResponse(await ApiHandler.getRequest(api: ApiEndpoints.techCrunchNewsApi));
    if(response !=null){
      techCrunchNewsList.value=[];
      for(var news in response['articles']){
        techCrunchNewsList.add(NewsModel.fromJson(news));
      }
      techCrunchFiveNewsList.value=techCrunchNewsList.sublist(0,5);
    }else {
      kPrint("Something went wrong in tech crunch news list");
    }

  }catch(e){
    kPrint(e.toString());
    throw e.toString();
  }finally{
    isTechCrunchNewsLoading.value=false;
  }
}


Future<void> searchNews(String search)async{
  try{
    isTechCrunchNewsLoading.value=true;
    var response=await ApiHandler.handleResponse(await ApiHandler.getRequest(api: ApiEndpoints.searchNewsApi(search: search)));
    if(response !=null){
      techCrunchNewsList.value=[];
      int i=0;
      for(var news in response['articles']){
        i++;
        techCrunchNewsList.add(NewsModel.fromJson(news));
        if(i==10){
          break;
        }
      }
      techCrunchFiveNewsList.value=techCrunchNewsList.sublist(0,5);
    }else {
      kPrint("Something went wrong in tech crunch news list");
    }

  }catch(e){
    kPrint(e.toString());
    throw e.toString();
  }finally{
    isTechCrunchNewsLoading.value=false;
  }
}




void setUpCompletionHandler() {
  flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;

  });
}

Future<void> speak(String text)async{
  isSpeaking.value=true;
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1.0);
  await flutterTts.setSpeechRate(0.4);
  await flutterTts.speak(text);
}


void stop()async{
  await flutterTts.stop();
  isSpeaking.value=false;
}

void pause()async{
  await flutterTts.pause();
  isSpeaking.value=false;
}

}