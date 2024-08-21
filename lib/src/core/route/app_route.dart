import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/features/dashboard/view/pages/dashboard.dart';
import 'package:news_app_dummy_api/src/features/details/view/pages/news_details_page.dart';
import 'package:news_app_dummy_api/src/features/home/view/pages/no_internet_page.dart';
import 'package:news_app_dummy_api/src/features/profile/view/page/profile_page.dart';
import 'package:news_app_dummy_api/src/features/splash/view/page/splash_page.dart';
import 'package:news_app_dummy_api/src/features/text_to_speak/view/page/text_to_speak_screen.dart';

class AppRoute{
  static const String splashScreen="/";
  static const String dashboard="/dashboard";
  static const String profilePage="/profile-page";
  static const String newsDetailsPage="/news_details-page";
  static const String textToSpeakScreen="/text-to-speak";
  static const String noInternetPage="/no-internet-page";

  static final appRouteList=[
    GetPage(
      name: AppRoute.splashScreen,
      page: ()=>const SplashPage(),
    ),
    GetPage(
      name: AppRoute.dashboard,
      page: ()=>const Dashboard(),
    ),
    GetPage(
      name: AppRoute.profilePage,
      page: ()=>const ProfilePage(),
    ),
    GetPage(
      name: AppRoute.newsDetailsPage,
      page: ()=> NewsDetailsPage(newsList: Get.arguments),
    ),
    GetPage(
      name: AppRoute.textToSpeakScreen,
      page: ()=>const TextToSpeakScreen(),
    ),
    GetPage(
      name: AppRoute.noInternetPage,
      page: ()=>const NoInternetPage(),
    ),
  ];

}