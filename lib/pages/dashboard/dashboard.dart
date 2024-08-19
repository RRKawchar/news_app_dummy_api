import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/components/bottom_navbar.dart';
import 'package:news_app_dummy_api/controller/bottom_nav_controller.dart';
import 'package:news_app_dummy_api/pages/home/home_page.dart';
import 'package:news_app_dummy_api/pages/profile/profile_page.dart';
import 'package:news_app_dummy_api/pages/tech/tech_crunch_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  BottomNavController bottomNavController=Get.put(BottomNavController());
  final _pages=[
    const HomePage(),
    const TechCrunchScreen(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(

        body: _pages[bottomNavController.index.value],
        floatingActionButton: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: BottomNavBar(),
        ),

    ),);
  }
}
