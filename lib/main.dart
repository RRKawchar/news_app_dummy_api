import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/core/di/app_bindings.dart';
import 'package:news_app_dummy_api/src/core/route/app_route.dart';
import 'package:news_app_dummy_api/src/core/theme/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      themeMode: ThemeMode.system,
      theme: lightTheme,
       darkTheme: darkTheme,
       initialRoute: AppRoute.splashScreen,
       getPages:AppRoute.appRouteList,
       initialBinding: AppBindings(),
      // home: Dashboard(),
      //  home: ShimmerLoadingTestScreen()
    );
  }
}

