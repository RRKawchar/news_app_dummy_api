import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/features/home/controller/news_controller.dart';
import 'package:news_app_dummy_api/src/core/utils/app_constants.dart';
import 'package:news_app_dummy_api/src/core/utils/assets_path.dart';
import 'package:news_app_dummy_api/src/features/home/model/news_model.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel newsList;
  const NewsDetailsPage({
    super.key,
    required this.newsList,
  });

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    newsController.setUpCompletionHandler();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new_outlined),
                          Text("Back")
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      newsList.urlToImage ?? dummyUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        newsList.title ?? "This news has no headline",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "${newsList.author} * ${newsList.publishedAt}",
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      newsList.author ?? "Unknown",
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).secondaryHeaderColor),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primaryContainer),
                  child: Row(
                    children: [
                      Obx(
                        () => newsController.isSpeaking.value
                            ? InkWell(
                                onTap: () {
                                  newsController.pause();
                                },
                                child: const Icon(
                                  Icons.stop,
                                  size: 50,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  newsController.speak(
                                    newsList.description ?? "No Description",
                                  );
                                },
                                child: const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 50,
                                ),
                              ),
                      ),
                      Obx(() => Expanded(
                            child: newsController.isSpeaking.value
                                ? Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: Image.asset(
                                      kAudioPlay,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: Image.asset(
                                      kAudioStop,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: Text(newsList.description ?? "No Description"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
