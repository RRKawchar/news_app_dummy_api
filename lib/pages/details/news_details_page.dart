import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/config/app_constants.dart';
import 'package:news_app_dummy_api/model/news_model.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel newsList;
  const NewsDetailsPage({
    super.key,
    required this.newsList,
  });

  @override
  Widget build(BuildContext context) {
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
                     newsList.urlToImage??dummyUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                 Row(
                  children: [
                    Flexible(
                      child: Text(
                       newsList.title??"This news has no headline",
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
                      "Riyazur Rohman Kawchar",
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).secondaryHeaderColor),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                 Row(
                  children: [
                    Flexible(
                      child: Text(
                          newsList.description??"No Description"),
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
