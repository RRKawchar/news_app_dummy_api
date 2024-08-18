import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/components/bottom_navbar.dart';
import 'package:news_app_dummy_api/config/app_constants.dart';
import 'package:news_app_dummy_api/controller/news_controller.dart';
import 'package:news_app_dummy_api/pages/details/news_details_page.dart';
import 'package:news_app_dummy_api/pages/home/widgets/news_for_you_tile.dart';
import 'package:news_app_dummy_api/pages/home/widgets/trending_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.dashboard),
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
                      newsController.getTrendingNews();
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
                    () => newsController.isTrendingNewsLoading.value?
                    const Center(child: CircularProgressIndicator(),):
                    Row(
                        children: newsController.trendingNewsList
                            .map(
                              (e) => TrendingCard(
                            onTap: () {
                              Get.to(NewsDetailsPage(
                                newsList: e,
                              ));
                            },
                            imageUrl: e.urlToImage!,
                            title: e.title.toString(),
                            author: e.author ?? "UnKnown",
                            tag: "Trending no 1",
                            time: e.publishedAt.toString(),
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
                () => newsController.isForYouNewsLoading.value?
                const Center(child: CircularProgressIndicator(),):
                Column(
                  children: newsController.forYouNewsListFive
                      .map(
                        (e) => NewsForYouTile(
                      onTap: () {
                        Get.to(NewsDetailsPage(newsList: e));
                      },
                      imageUrl: e.urlToImage ?? dummyUrl,
                      title: e.title ?? "This news has no headline",
                      author: e.author ?? "Unknown",
                      time: e.publishedAt ?? "Published date empty",
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
                    () => newsController.isAppleNewsLoading.value?
                        const Center(child: CircularProgressIndicator(),):
                        Column(
                         children: newsController.appleFiveNewsList
                          .map(
                            (e) => NewsForYouTile(
                          onTap: () {
                            Get.to(NewsDetailsPage(newsList: e));
                          },
                          imageUrl: e.urlToImage ?? dummyUrl,
                          title: e.title ?? "This news has no headline",
                          author: e.author ?? "Unknown",
                          time: e.publishedAt ?? "Published date empty",
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
                        () => newsController.isTeslaNewsLoading.value?
                            const Center(child: CircularProgressIndicator(),):
                            Row(
                            children: newsController.teslaFiveNewsList
                                .map(
                                  (e) => TrendingCard(
                                onTap: () {
                                  Get.to(NewsDetailsPage(
                                    newsList: e,
                                  ));
                                },
                                imageUrl: e.urlToImage!,
                                title: e.title.toString(),
                                author: e.author ?? "UnKnown",
                                tag: "Trending no 1",
                                time: e.publishedAt.toString(),
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
                    () =>newsController.isBusinessNewsLoading.value?
                        const Center(child: CircularProgressIndicator(),):
                        Column(
                          children: newsController.businessFiveNewsList
                          .map(
                            (e) => NewsForYouTile(
                          onTap: () {
                            Get.to(NewsDetailsPage(newsList: e));
                          },
                          imageUrl: e.urlToImage ?? dummyUrl,
                          title: e.title ?? "This news has no headline",
                          author: e.author ?? "Unknown",
                          time: e.publishedAt ?? "Published date empty",
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
