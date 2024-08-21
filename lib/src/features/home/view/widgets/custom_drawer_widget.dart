import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/core/route/app_route.dart';
import 'package:news_app_dummy_api/src/core/utils/assets_path.dart';
import 'package:news_app_dummy_api/src/features/text_to_speak/view/page/text_to_speak_screen.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                kAppLogo,
                height: 170,
                width: 170,
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(AppRoute.textToSpeakScreen);
              },
              title: const Text("Text To Speech"),
              leading: const Icon(Icons.arrow_right_outlined),
            )
          ],
        ),
      ),
    );
  }
}
