import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/features/dashboard/controller/bottom_nav_controller.dart';
import 'package:news_app_dummy_api/src/features/home/controller/news_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => BottomNavController(),fenix: true);
  Get.lazyPut(() => NewsController(),fenix: true);
  }

}