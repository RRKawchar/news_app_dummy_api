import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/config/theme.dart';
import 'package:news_app_dummy_api/pages/shimmer_loading_test_screen.dart';

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
      //home: Dashboard(),
      home: ShimmerLoadingTestScreen(),
    );
  }
}

