import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/features/home/controller/news_controller.dart';
import 'package:news_app_dummy_api/src/core/components/news_for_you_shimmer.dart';
import 'package:news_app_dummy_api/src/core/components/trending_shimmer_loading.dart';
import 'package:news_app_dummy_api/src/core/utils/app_constants.dart';
import 'package:news_app_dummy_api/src/features/details/view/pages/news_details_page.dart';
import 'package:news_app_dummy_api/src/features/home/view/widgets/custom_drawer_widget.dart';
import 'package:news_app_dummy_api/src/features/home/view/widgets/news_for_you_tile.dart';
import 'package:news_app_dummy_api/src/features/home/view/widgets/trending_card.dart';
import 'package:news_app_dummy_api/src/features/profile/view/page/profile_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  NewsController newsController = Get.put(NewsController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: ()=>_scaffoldKey.currentState!.openDrawer(),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.dashboard),
                    ),
                  ),
                  const Text(
                    "News Portal",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const ProfilePage());
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(Icons.person),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isTrendingNewsLoading.value
                        ? const Row(
                      children: [
                        TrendingShimmerLoading(),
                        TrendingShimmerLoading(),
                      ],
                    )
                        : Row(
                            children: newsController.trendingNewsList
                                .map((trendingNews) => TrendingCard(
                                    onTap: () {
                                      Get.to(NewsDetailsPage(
                                        newsList: trendingNews,
                                      ));
                                    },
                                    imageUrl: trendingNews.urlToImage!,
                                    title: trendingNews.title.toString(),
                                    author: trendingNews.author ?? "UnKnown",
                                    tag: "Trending no 1",
                                    time: trendingNews.publishedAt.toString(),
                                  ),
                                )
                                .toList()),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News For You",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isForYouNewsLoading.value
                    ? const Column(
                  children: [
                      NewsForYouShimmer(),
                      NewsForYouShimmer(),
                      NewsForYouShimmer(),

                ],)
                    : Column(
                        children: newsController.forYouNewsListFive
                            .map((forYouNews) => NewsForYouTile(
                                onTap: () {
                                  Get.to(NewsDetailsPage(newsList: forYouNews));
                                },
                                imageUrl: forYouNews.urlToImage ?? dummyUrl,
                                title: forYouNews.title ?? "This news has no headline",
                                author: forYouNews.author ?? "Unknown",
                                time: forYouNews.publishedAt ?? "Published date empty",
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apple News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isAppleNewsLoading.value
                    ?  const Column(
                  children: [
                    NewsForYouShimmer(),
                    NewsForYouShimmer(),
                    NewsForYouShimmer(),

                  ],)
                    : Column(
                        children: newsController.appleFiveNewsList
                            .map((appleNews) => NewsForYouTile(
                                onTap: () {
                                  Get.to(NewsDetailsPage(newsList: appleNews));
                                },
                                imageUrl: appleNews.urlToImage ?? dummyUrl,
                                title: appleNews.title ?? "This news has no headline",
                                author: appleNews.author ?? "Unknown",
                                time: appleNews.publishedAt ?? "Published date empty",
                              ),
                            )
                            .toList(),
                      ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tesla News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isTechCrunchNewsLoading.value
                        ? const Row(
                      children: [
                        TrendingShimmerLoading(),
                        TrendingShimmerLoading(),
                      ],
                    )
                        : Row(
                            children: newsController.techCrunchFiveNewsList
                                .map((teslaNews) => TrendingCard(
                                    onTap: () {
                                      Get.to(NewsDetailsPage(
                                        newsList: teslaNews,
                                      ));
                                    },
                                    imageUrl: teslaNews.urlToImage!,
                                    title: teslaNews.title.toString(),
                                    author: teslaNews.author ?? "UnKnown",
                                    tag: "Trending no 1",
                                    time: teslaNews.publishedAt.toString(),
                                  ),
                                )
                                .toList()),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => newsController.isBusinessNewsLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: newsController.businessFiveNewsList
                            .map((businessNews) => NewsForYouTile(
                                onTap: () {
                                  Get.to(NewsDetailsPage(newsList: businessNews));
                                },
                                imageUrl: businessNews.urlToImage ?? dummyUrl,
                                title: businessNews.title ?? "This news has no headline",
                                author: businessNews.author ?? "Unknown",
                                time: businessNews.publishedAt ?? "Published date empty",
                              ),
                            )
                            .toList(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
