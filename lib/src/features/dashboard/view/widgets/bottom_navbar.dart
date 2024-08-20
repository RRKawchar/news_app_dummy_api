import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/features/dashboard/controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {

    final BottomNavController bottomNavController=Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 60,
          width: 200,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(100)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap:(){
                  bottomNavController.index.value=0;
              },
                child: Obx(()=>AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve:Curves.bounceInOut,
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: bottomNavController.index.value==0?Theme.of(context).colorScheme.primary:null,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.home,
                      size: 25,
                      color:bottomNavController.index.value==0?
                      Theme.of(context).colorScheme.onBackground:
                      Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),)
              ),
              InkWell(
                onTap:(){
                  bottomNavController.index.value=1;
                },
                child: Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve:Curves.bounceInOut,
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: bottomNavController.index.value==1?Theme.of(context).colorScheme.primary:null,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.book,
                      size: 25,
                      color:bottomNavController.index.value==1?
                      Theme.of(context).colorScheme.onBackground:
                      Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),),
              ),
              InkWell(
                onTap:(){
                  bottomNavController.index.value=2;
                },
                child: Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve:Curves.bounceInOut,
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: bottomNavController.index.value==2?Theme.of(context).colorScheme.primary:null,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.settings,
                      size: 25,
                      color:bottomNavController.index.value==2?
                      Theme.of(context).colorScheme.onBackground:
                      Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
