import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/features/text_to_speak/view/page/text_to_speak_screen.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width/1.5,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                shape: BoxShape.circle
              ),
              child: const Text("NEWS",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48
              ),),
            ),

            ListTile(
              onTap: (){
               Get.to(const TextToSpeakScreen());
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
