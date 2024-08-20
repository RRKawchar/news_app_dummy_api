import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/features/home/controller/news_controller.dart';
import 'package:news_app_dummy_api/src/core/components/news_for_you_shimmer.dart';
import 'package:news_app_dummy_api/src/core/utils/app_constants.dart';
import 'package:news_app_dummy_api/src/features/details/view/pages/news_details_page.dart';
import 'package:news_app_dummy_api/src/features/home/view/widgets/news_for_you_tile.dart';
import 'package:news_app_dummy_api/src/features/tech/view/widgets/search_widget.dart';

class TechCrunchScreen extends StatefulWidget {
  const TechCrunchScreen({super.key});

  @override
  State<TechCrunchScreen> createState() => _TechCrunchScreenState();
}

class _TechCrunchScreenState extends State<TechCrunchScreen> {
  NewsController newsController = Get.put(NewsController());
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
               SearchWidget(textEditingController: textEditingController,),
              const SizedBox(height: 20),
              Obx(
                    () =>newsController.isTechCrunchNewsLoading.value?
                const Column(
                  children: [
                    NewsForYouShimmer(),
                    NewsForYouShimmer(),
                    NewsForYouShimmer(),

                  ],)
                    :
                Column(
                    children: newsController.techCrunchNewsList
                        .map((news) =>
                        NewsForYouTile(
                          onTap: () {
                            Get.to(NewsDetailsPage(newsList: news));
                          },
                          imageUrl: news.urlToImage ?? dummyUrl,
                          title: news.title ?? "No Headline",
                          author: news.author ?? "Unknown",
                          time: news.publishedAt ?? "Time Empty",
                        ),
                    )
                        .toList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
