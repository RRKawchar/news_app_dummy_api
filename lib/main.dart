import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/core/theme/theme.dart';
import 'package:news_app_dummy_api/src/features/dashboard/view/pages/dashboard.dart';


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
       home: Dashboard(),
      // home: TextToSpeakScreen()
    );
  }
}

