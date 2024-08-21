import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/core/route/app_route.dart';
import 'package:news_app_dummy_api/src/core/utils/assets_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();

  }


   void _navigateToNext()async{
   await Future.delayed(const Duration(seconds: 2),(){
       Get.offAllNamed(AppRoute.dashboard);
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(kAppLogo,width: 100)),
      ),
    );
  }
}
